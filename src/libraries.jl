"""
Platform-dependent shared-library names.

Each library is a global assigned in `__init__`, so the value is resolved
at load time on the running machine rather than baked in during
precompilation. `@ccall libdcam.f(...)` then works on any platform.

Override any path with the matching environment variable, e.g.
`MICROSCOPECONTROL_LIBDCAM=/opt/hamamatsu/lib/libdcamapi.so`.

Linux names are provisional: they follow vendor convention but are
unverified against a real install. The env-var override exists so a
wrong guess costs nothing.
"""
module Libraries


export libdcam, libthorlabs_tsi, libmadlib, libmicrodrive,
       libuc480, libokfrontpanel, libpigcs2, libsmaractctl, libblink

global libdcam::String = ""
global libthorlabs_tsi::String = ""
global libmadlib::String = ""
global libmicrodrive::String = ""
global libuc480::String = ""
global libokfrontpanel::String = ""
global libpigcs2::String = ""
global libsmaractctl::String = ""
global libblink::String = ""

_pick(key, win, linux) = get(ENV, "MICROSCOPECONTROL_" * uppercase(key),
    Sys.iswindows() ? win :
    Sys.islinux()   ? linux :
    "")

function __init__()
    global libdcam = _pick("libdcam",
        "dcamapi.dll", "libdcamapi.so")
    global libthorlabs_tsi = _pick("libthorlabs_tsi",
        "thorlabs_tsi_camera_sdk.dll", "libthorlabs_tsi_camera_sdk.so")
    global libmadlib = _pick("libmadlib",
        raw"C:\Program Files\Mad City Labs\NanoDrive\Madlib.dll",
        "libmadlib.so")
    global libmicrodrive = _pick("libmicrodrive",
        raw"C:\Program Files\Mad City Labs\MicroDrive\Microdrive.dll",
        "libmicrodrive.so")
    global libuc480 = _pick("libuc480",
        raw"C:\Windows\System32\uc480_64.dll", "libueye_api.so")
    global libokfrontpanel = _pick("libokfrontpanel",
        raw"C:\Program Files\Opal Kelly\FrontPanelUSB\API\lib\x64\okFrontPanel.dll",
        "libokFrontPanel.so")
    global libpigcs2 = _pick("libpigcs2",
        raw"C:\Program Files (x86)\Physik Instrumente (PI)\Software Suite\Development\C++\API\PI_GCS2_DLL_x64.dll",
        "libpi_pi_gcs2.so")
    global libsmaractctl = _pick("libsmaractctl",
        raw"C:\Windows\System32\SmarActCTL.dll", "libsmaractctl.so")
    global libblink = _pick("libblink",
        raw"C:\Program Files\Meadowlark Optics\Blink OverDrive Plus\SDK\Blink_C_wrapper.dll",
        "libBlink_C_wrapper.so")
end

"""
    isavailable(lib::AbstractString) -> Bool

Whether `lib` can actually be opened on this machine. Lets a device
constructor fail with a clear message instead of a raw dlopen error
from inside a `@ccall`.
"""
function isavailable(lib::AbstractString)
    isempty(lib) && return false
    try
        h = Base.Libc.Libdl.dlopen(lib)
        Base.Libc.Libdl.dlclose(h)
        true
    catch
        false
    end
end

end # module
