document.addEventListener("DOMContentLoaded", function () {
    const submenus = document.querySelectorAll('.dropdown-submenu');
    const dropdowns = document.querySelectorAll('.dropdown');

    // Sadece masa�st� i�in hover davran��� uygula
    if (window.innerWidth >= 992) {
        submenus.forEach(function (submenu) {
            submenu.addEventListener('mouseenter', function () {
                submenu.classList.add('show');
            });

            submenu.addEventListener('mouseleave', function () {
                submenu.classList.remove('show');
            });
        });
    }

    // Ana dropdown kapan�nca alt submenu'leri kapat
    dropdowns.forEach(function (dropdown) {
        dropdown.addEventListener('hidden.bs.dropdown', function () {
            dropdown.querySelectorAll('.dropdown-submenu.show').forEach(function (submenu) {
                submenu.classList.remove('show');
            });
        });
    });
});
