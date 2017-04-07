module USB

include("API.jl")

type Endpoint
    desc::libusb_endpoint_descriptor
end

function Base.show(io::IO, e::Endpoint, tabs=0)
    x = e.desc
    println(io, "\t"^tabs * "USB.Endpoint(address = $(bits(x.bEndpointAddress)), type = $(libusb_descriptor_type(x.bDescriptorType)))")
    return
end

type AlternateSetting
    desc::libusb_interface_descriptor
    endpoints::Vector{Endpoint}
end

function Base.show(io::IO, a::AlternateSetting, tabs=0)
    x = a.desc
    println(io, "\t"^tabs * "USB.AlternateSetting(id = $(Int(x.bInterfaceNumber)), type = $(libusb_descriptor_type(x.bDescriptorType)), class = $(libusb_class_code(x.bInterfaceClass)))")
    for e in a.endpoints
        show(io, e, tabs + 1)
    end
    return
end

type Interface
    desc::libusb_interface
    altsettings::Vector{AlternateSetting}
end

function Base.show(io::IO, i::Interface, tabs=0)
    x = i.desc
    println(io, "\t"^tabs * "USB.Interface()")
    for a in i.altsettings
        show(io, a, tabs + 1)
    end
    return
end

type Configuration
    desc::libusb_config_descriptor
    interfaces::Vector{Interface}
end

function Base.show(io::IO, c::Configuration, tabs=0)
    x = c.desc
    println(io, "\t"^tabs * "USB.Configuration(id = $(Int(x.bConfigurationValue)), type = $(libusb_descriptor_type(x.bDescriptorType)))")
    for i in c.interfaces
        show(io, i, tabs + 1)
    end
    return
end

type Device
    desc::libusb_device_descriptor
    configurations::Vector{Configuration}
end

function Base.show(io::IO, d::Device)
    x = d.desc
    println(io, "USB.Device(type = $(libusb_descriptor_type(x.bDescriptorType)), class = $(libusb_class_code(x.bDeviceClass)), vendor:product = $(Int(x.idVendor)):$(Int(x.idProduct)))")
    for c in d.configurations
        show(io, c, 1)
    end
    return
end

function devices()
    listRef = Ref{Ptr{Ptr{USB.libusb_device}}}()
    len = USB.libusb_get_device_list(USB.ctx, listRef)
    list = unsafe_wrap(Vector{Ptr{USB.libusb_device}}, listRef[], len)
    # finalizer(list, x->USB.libusb_free_device_list(listRef[], 0))
    devices = USB.Device[]
    for d in list
        desc1 = Ref{USB.libusb_device_descriptor}(USB.libusb_device_descriptor())
        USB.libusb_get_device_descriptor(d, desc1)
        configs = USB.Configuration[]
        push!(devices, USB.Device(desc1[], configs))
        for c = 0x00:desc1[].bNumConfigurations-1
            desc2 = Ref{Ptr{USB.libusb_config_descriptor}}()
            USB.libusb_get_config_descriptor(d, c, desc2)
            con = unsafe_load(desc2[])
            interfaces = USB.Interface[]
            push!(configs, USB.Configuration(con, interfaces))
            if con.interface != C_NULL
                inters = unsafe_wrap(Vector{USB.libusb_interface}, con.interface, con.bNumInterfaces)
                for i = 0x01:con.bNumInterfaces
                    inter = inters[i]
                    altsettings = USB.AlternateSetting[]
                    push!(interfaces, USB.Interface(inter, altsettings))
                    if inter.altsetting != C_NULL
                        alts = unsafe_wrap(Vector{USB.libusb_interface_descriptor}, inter.altsetting, inter.num_altsetting)
                        for a = Cint(1):inter.num_altsetting
                            alt = alts[a]
                            endpoints = USB.Endpoint[]
                            push!(altsettings, USB.AlternateSetting(alt, endpoints))
                            if alt.endpoint != C_NULL
                                ends = unsafe_wrap(Vector{USB.libusb_endpoint_descriptor}, alt.endpoint, alt.bNumEndpoints)
                                for e = 0x01:alt.bNumEndpoints
                                    push!(endpoints, USB.Endpoint(ends[e]))
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return devices
end


end # module
