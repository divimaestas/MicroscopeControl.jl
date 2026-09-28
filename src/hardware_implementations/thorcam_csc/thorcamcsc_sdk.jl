#Contains functions for opening and closing SDK

function thorcamsdkinit()
    err = @ccall libthorlabs_tsi.tl_camera_open_sdk()::Cint #Returns zero if successful
    if err != 0
        @error "ThorCamCSC SDK Failed to Open"
    end
    return err
end


function thorcamsdkuninit()
    err = @ccall libthorlabs_tsi.tl_camera_close_sdk()::Cint #Returns zero if successful
    if err != 0
        @error "ThorCamCSC SDK Failed to Close"
    end
    return err
end

function shutdown(cam::ThorCamCSCCamera)
    is_closed = closecamera(cam)
    is_sdk_uninit = thorcamsdkuninit()

    return is_closed, is_sdk_uninit
end