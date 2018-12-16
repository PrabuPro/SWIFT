document.addEventListener('DOMContentLoaded', () => {
    var tabHeaders = document.getElementsByClassName('tab-header');
    var tabs = document.getElementsByClassName('tab');

    // if path/to/here#add || path/to/gere#add-success is loaded after adding a new user, display Add tab
    var urlAnchor = window.location.hash.substr(1);
    if (urlAnchor && (urlAnchor === 'add' || urlAnchor === 'add-success')) {
        unsetTabHeaderIsActive();

        let selectedTabContents;

        if (section === 'admin') {
            tabHeaders[1].classList.add('is-active'); // add tabHeader
            selectedTabContents = document.querySelectorAll('[data-content="1"]'); // add tab
        } 

        if (section === 'employee') {
            tabHeaders[2].classList.add('is-active'); // add tabHeader
            selectedTabContents = document.querySelectorAll('[data-content="2"]'); // add tab
        }
        
        activateTab(selectedTabContents);

        if (urlAnchor === 'add-success') {
            document.getElementById('success-notification').style.display = 'block';
            window.history.replaceState('', 'Employees', '#add'); // replaces the #add-success with #add
        }
    }

    if (urlAnchor && urlAnchor === 'no-record') {
        document.getElementById('no-record-notification').style.display = 'block';
        window.history.replaceState('', 'Employees', '#');

        if (section === 'employee') {
            unsetTabHeaderIsActive();
            tabHeaders[1].classList.add('is-active');
            selectedTabContents = document.querySelectorAll('[data-content="1"]');
            activateTab(selectedTabContents);
        }
    }

    if (urlAnchor && urlAnchor === 'search') {
        unsetTabHeaderIsActive();
        tabHeaders[1].classList.add('is-active');
        selectedTabContents = document.querySelectorAll('[data-content="1"]');
        activateTab(selectedTabContents);
    }

    if (urlAnchor && urlAnchor === 'delete-success') {
        document.getElementById('employee-delete-success-notification').style.display = 'block';
        window.history.replaceState('', 'Employees', '#');
    }

    if (urlAnchor && urlAnchor === 'delete-error') {
        document.getElementById('employee-delete-error-notification').style.display = 'block';
        window.history.replaceState('', 'Employees', '#');
    }


    for (let i = 0; i < tabHeaders.length; i++) {
        tabHeaders[i].addEventListener('click', function() {
            unsetTabHeaderIsActive();     
            this.classList.add('is-active');
            let selectedTabContents = document.querySelectorAll('[data-content="' + this.dataset.tab + '"]');
            activateTab(selectedTabContents);
        });
    }

    const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
    if ($navbarBurgers.length > 0) {
        $navbarBurgers.forEach( el => {
            el.addEventListener('click', () => {
                let dashboardNav = document.getElementById('dashboard-nav');
                dashboardNav.classList.toggle('dashboard-nav-active');
                el.classList.toggle('is-active');
            });
        });
    }

    function unsetTabHeaderIsActive() {
        for (let j = 0; j < tabHeaders.length; j++) {
            tabHeaders[j].classList.remove('is-active');
            tabs[j].classList.remove('is-active');
        }
    }

    function activateTab(selectedTabContents) {
        selectedTabContents.forEach(function(selectedTabContent) {
            selectedTabContent.classList.add('is-active');
        });
    }

    var deleteEmpForms = Array.prototype.slice.call(document.querySelectorAll('.delete-emp-form'), 0);

    if (deleteEmpForms.length > 0) {
        deleteEmpForms.forEach(el => {
            el.addEventListener('submit', (e) => {
                e.preventDefault();
                if (confirm("Do you want to delete the employee record? This can't be undone!")) {
                   el.submit();
                }
            });
        });
    }

});