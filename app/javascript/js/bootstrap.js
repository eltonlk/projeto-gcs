import 'bootstrap/js/src/alert'
// import 'bootstrap/js/src/button'
// import 'bootstrap/js/src/carousel'
import 'bootstrap/js/src/collapse'
import 'bootstrap/js/src/dropdown'
// import 'bootstrap/js/src/modal'
// import 'bootstrap/js/src/popover'
import 'bootstrap/js/src/scrollspy'
// import 'bootstrap/js/src/tab'
import 'bootstrap/js/src/toast'
// import 'bootstrap/js/src/tooltip'


import Toast from 'bootstrap/js/dist/toast'

window.Toast = Toast

document.addEventListener("DOMContentLoaded", function() {
  let toastElList = [].slice.call(document.querySelectorAll('.toast'))

  toastElList.map(function (toastEl) {
    let toast = new Toast(toastEl)

    toast.show()
  })
})
