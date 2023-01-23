$(() => {
    window.addEventListener('message', (event) => {
        let v = event.data
        if (v.active == true) {
            $('.street').fadeIn(500)
            if (v.street2 == 0) {
                $('.street').html(v.street)
            }else {
                $('.street').html(v.street + ' & ' + v.street2)
            }
        }else{
            $('.street').fadeOut(500)
        }
    })
})