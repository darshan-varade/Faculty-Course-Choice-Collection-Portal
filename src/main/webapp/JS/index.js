document.querySelectorAll('.dropdown-toggle').forEach(item => {
           item.addEventListener('click', event => {
               const dropdownContent = event.target.nextElementSibling;
               if (dropdownContent.style.display === 'block') {
                   dropdownContent.style.display = 'none';
               } else {
                   dropdownContent.style.display = 'block';
               }
           });
       });

       window.onclick = function(event) {
           if (!event.target.matches('.dropdown-toggle')) {
               document.querySelectorAll('.dropdown-content').forEach(dropdown => {
                   dropdown.style.display = 'none';
               });
           }
       }