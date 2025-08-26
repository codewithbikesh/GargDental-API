$(document).ready(function () {
    if ($('#productsTable').length) {
        function loadProductsTable(categoryId = '') {
            $('#productsTable').DataTable({
                processing: true,
                serverSide: true,
                pageLength: 50,
                destroy: true,
                stateSave: true,
                ajax: {
                    url: $('#productsTable').data('url'),
                    data: { category_id: categoryId }
                },
                columns: [
                    { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
                    { data: 'product_code', name: 'product_code' },
                    { data: 'product_name', name: 'product_name' },
                    { data: 'category', name: 'category.category_name' },
                    { data: 'has_variations', name: 'has_variations' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'status', name: 'status', orderable: false, searchable: false },
                    { data: 'action', name: 'action', orderable: false, searchable: false }
                ]
            });
        }
        
        loadProductsTable();
        
        $('#categoryFilter').on('change', function() {
            let selectedCategory = $(this).val();
            loadProductsTable(selectedCategory);
        });
    }

    if ($('#categoriesTable').length) {
        const table = $('#categoriesTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: $('#categoriesTable').data('url'),
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
                { data: 'category_name', name: 'category_name' },
                { data: 'top', name: 'top', orderable: false, searchable: false },
                { data: 'status', name: 'status', orderable: false, searchable: false },
                { data: 'action', name: 'action', orderable: false, searchable: false }
            ]
        });

    // Event delegation for all toggle buttons
    $('#categoriesTable').on('click', '.toggle-subcategory', function(e) {
        e.preventDefault();
        e.stopPropagation();
        
        const button = $(this);
        const icon = button.find('i');
        const id = button.data('id');
        const row = table.row(button.closest('tr'));

        if (row.child.isShown()) {
            // Collapse the row
            row.child.hide();
            icon.removeClass('fa-chevron-down').addClass('fa-chevron-right');
        } else {
            // Show loading state
            icon.removeClass('fa-chevron-right').addClass('fa-spinner fa-spin');
            
            // Fetch subcategories
            $.get(`/admin/categories/subcategories/${id}`, function(response) {
                // Create container with proper class
                const container = $('<div class="subcategory-container"></div>').html(response.html);
                
                // Show child row
                row.child(container).show();
                
                // Update icon
                icon.removeClass('fa-spinner fa-spin').addClass('fa-chevron-down');
                
                // Initialize nested toggles
                initNestedToggles(container);
                
            }).fail(function() {
                icon.removeClass('fa-spinner fa-spin').addClass('fa-chevron-right');
            });
        }
    });

    // Function to initialize nested toggles
    function initNestedToggles(container) {
        container.on('click', '.toggle-subcategory', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            const button = $(this);
            const icon = button.find('i');
            const id = button.data('id');
            const parentRow = button.closest('tr');
            const childContainer = parentRow.next('.subcategory-container');
            
            if (childContainer.length && childContainer.is(':visible')) {
                // Collapse
                childContainer.hide();
                icon.removeClass('fa-chevron-down').addClass('fa-chevron-right');
            } else {
                // Show loading
                icon.removeClass('fa-chevron-right').addClass('fa-spinner fa-spin');
                
                $.get(`/admin/categories/subcategories/${id}`, function(response) {
                    // Remove existing container if any
                    if (childContainer.length) {
                        childContainer.remove();
                    }
                    
                    // Create new container
                    const newContainer = $('<div class="subcategory-container"></div>')
                        .html(response.html)
                        .insertAfter(parentRow);
                    
                    // Update icon
                    icon.removeClass('fa-spinner fa-spin').addClass('fa-chevron-down');
                    
                    // Initialize further nested toggles
                    initNestedToggles(newContainer);
                    
                }).fail(function() {
                    icon.removeClass('fa-spinner fa-spin').addClass('fa-chevron-right');
                });
            }
        });
    }
    }

    if ($('#brandsTable').length) {
        $('#brandsTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: $('#brandsTable').data('url'),
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
                { data: 'brand_name', name: 'brand_name' },
                { data: 'top', name: 'top', orderable: false, searchable: false },
                { data: 'status', name: 'status', orderable: false, searchable: false },
                { data: 'action', name: 'action', orderable: false, searchable: false }
            ]
        });
    }
    
    if ($('#carriersTable').length) {
        $('#carriersTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: $('#carriersTable').data('url'),
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
                { data: 'name', name: 'name' },
                { data: 'address', name: 'address' },
                { data: 'phone', name: 'phone' },
                { data: 'type', name: 'type' },
                { data: 'status', name: 'status', orderable: false, searchable: false },
                { data: 'action', name: 'action', orderable: false, searchable: false }
            ]
        });
    }
    
    if ($('#clinicTable').length) {
        $('#clinicTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: $('#clinicTable').data('url'),
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
                { data: 'full_name', name: 'full_name' },
                { data: 'email', name: 'email' },
                { data: 'phone', name: 'phone' },
                { data: 'city', name: 'city' },
                { data: 'budget', name: 'budget' },
                { data: 'remarks', name: 'remarks' },
                { data: 'created_at', name: 'created_at' },
            ]
        });
    }
    
    if ($('#couponsTable').length) {
        $('#couponsTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: $('#couponsTable').data('url'),
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
                { data: 'title', name: 'title' },
                { data: 'code', name: 'code' },
                { data: 'start_date', name: 'start_date' },
                { data: 'expire_date', name: 'expire_date' },
                { data: 'minimum_purchase', name: 'minimum_Purchase' },
                { data: 'discount', name: 'discount' },
                { data: 'status', name: 'status', orderable: false, searchable: false },
                { data: 'action', name: 'action', orderable: false, searchable: false }
            ]
        });
    }

    if ($('#customersTable').length) {
        $('#customersTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: $('#customersTable').data('url'),
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
                { data: 'full_name', name: 'full_name' },
                { data: 'email', name: 'email' },
                { data: 'phone', name: 'phone' },
                { data: 'action', name: 'action', orderable: false, searchable: false }
            ]
        });
    }

    if ($('#ordersTable').length) {
        $('#ordersTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: $('#ordersTable').data('url'),
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
                { data: 'order_id', name: 'order_id' },
                { data: 'customer', name: 'customer.full_name' },
                { data: 'shipping_address', name: 'deliveryInformation.city.city' },
                { data: 'total_items', name: 'orderItems.count', searchable: false },
                { data: 'total_amount', name: 'total_amount' },
                { data: 'order_status', name: 'order_status' },
                { data: 'payment_status', name: 'payment_status' },
                { data: 'created_at', name: 'created_at' },
                { data: 'action', name: 'action', orderable: false, searchable: false }
            ]
        });
    }

    if ($('#zonesTable').length) {
        $('#zonesTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: $('#zonesTable').data('url'),
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
                { data: 'city', name: 'city.city' },
                { data: 'zone_name', name: 'zone_name' },
                { data: 'created_at', name: 'created_at' },
                { data: 'action', name: 'action', orderable: false, searchable: false }
            ]
        });
    }

    if ($('#ratingsTable').length) {
        $('#ratingsTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: $('#ratingsTable').data('url'),
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
                { data: 'name', name: 'name' },
                { data: 'email', name: 'email' },
                { data: 'product', name: 'product' },
                { data: 'rating', name: 'rating' },
                { data: 'review_detail', name: 'review_detail' },
                { data: 'action', name: 'action', orderable: false, searchable: false }
            ]
        });
    }

    if ($('#inquiriesTable').length) {
        $('#inquiriesTable').DataTable({
        processing: true,
        serverSide: true,
        ajax: $('#inquiriesTable').data('url'),
        columns: [
            { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
            { data: 'name', name: 'name' },
            { data: 'email', name: 'email' },
            { data: 'message', name: 'message' },
            { data: 'created_at', name: 'created_at' },
            { data: 'action', name: 'action', orderable: false, searchable: false }
        ]
        });
    }
    
    if ($('#grievancesTable').length) {
        $('#grievancesTable').DataTable({
        processing: true,
        serverSide: true,
        ajax: $('#grievancesTable').data('url'),
        columns: [
            { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
            { data: 'full_name', name: 'full_name' },
            { data: 'email', name: 'email' },
            { data: 'phone', name: 'phone' },
            { data: 'city', name: 'city' },
            { data: 'created_at', name: 'created_at' },
            { data: 'action', name: 'action', orderable: false, searchable: false }
        ]
        });
    }
    
    if ($('#newslettersTable').length) {
        $('#newslettersTable').DataTable({
        processing: true,
        serverSide: true,
        ajax: $('#newslettersTable').data('url'),
        columns: [
            { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
            { data: 'email', name: 'email' },
            { data: 'created_at', name: 'created_at' },
            { data: 'action', name: 'action', orderable: false, searchable: false }
        ]
        });
    }

    if ($('#usersTable').length) {
        $('#usersTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: $('#usersTable').data('url'),
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
                { data: 'name', name: 'name' },
                { data: 'email', name: 'email' },
                { data: 'phone', name: 'phone' },
                { data: 'role_id', name: 'role_id' },
                { data: 'action', name: 'action', orderable: false, searchable: false },
            ]
        });
    }

    if ($('#provincesTable').length) {
        $('#provincesTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: $('#provincesTable').data('url'),
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
                { data: 'province_name', name: 'province_name' },
                { data: 'action', name: 'action', orderable: false, searchable: false },
            ]
        });
    }

    if ($('#citiesTable').length) {
        $('#citiesTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: $('#citiesTable').data('url'),
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
                { data: 'province', name: 'province.province_name' },
                { data: 'city', name: 'city' },
                { data: 'shipping_cost', name: 'shipping_cost' },
                { data: 'apply_shipping', name: 'apply_shipping', orderable: false, searchable: false },
                { data: 'created_at', name: 'created_at' },
                { data: 'action', name: 'action', orderable: false, searchable: false }
            ]
        });
    }

    if ($('#cancelreasonsTable').length) {
        $('#cancelreasonsTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: $('#cancelreasonsTable').data('url'),
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
                { data: 'reason_name', name: 'reason_name' },
                { data: 'reason_type', name: 'reason_type' },
                { data: 'reason_for', name: 'reason_for' },
                { data: 'status', name: 'status', orderable: false, searchable: false },
                { data: 'action', name: 'action', orderable: false, searchable: false },
            ]
        });
    }

    $(document).on('change', '.redirect-url', function () {
        let url = $(this).data('url');
        if (url) {
            window.location.href = url;
        }
    });

});