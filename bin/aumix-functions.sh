function getVolume() {
    
    vol_arr=(`aumix -vq`)

    vol_with_comma=${vol_arr[1]}

    current_vol=${vol_with_comma%,}

    echo $current_vol
}
