<footer id="footer" class="footer">
    <div class="copyright">
    Copyright &copy; {{ now()->year }} <strong><a href="https://globaltechnepal.com" target="_blank">Global Tech Nepal Pvt. Ltd.</a></strong>
    </div>
</footer><!-- End Footer -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
    <script>
        $('.redirect-url').on('change', function () {
            let url = $(this).data('url');
            if (url) {
                window.location.href = url;
            }
        });
    </script>
    <script src="{{ dynamicAsset('public/backend/vendor/apexcharts/apexcharts.min.js')}}"></script>
    <script src="{{ dynamicAsset('public/backend/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
    <script src="{{ dynamicAsset('public/backend/vendor/chart.js/chart.umd.js')}}"></script>
    <script src="{{ dynamicAsset('public/backend/vendor/echarts/echarts.min.js')}}"></script>
    <script src="{{ dynamicAsset('public/backend/vendor/quill/quill.min.js')}}"></script>
    <script src="{{ dynamicAsset('public/backend/vendor/tinymce/tinymce.min.js')}}"></script>
    <script src="{{ dynamicAsset('public/backend/vendor/php-email-form/validate.js')}}"></script>
    <script src="{{ dynamicAsset('public/backend/js/main.js')}}"></script>
    <script src="{{ dynamicAsset('public/backend/js/jquery.dataTables.min.js')}}"></script>
    <script src="{{ dynamicAsset('public/backend/js/dataTables.bootstrap4.min.js')}}"></script>
    <script src="{{ dynamicAsset('public/backend/js/datatables-demo.js')}}"></script>
    <script src="{{ dynamicAsset('public/backend/js/datatables.js')}}"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
    <!-- Select2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        document.querySelectorAll('.ckeditor').forEach(textarea => {
            ClassicEditor
                .create(textarea, {height: '300px'})
                .catch(error => {
                    console.error(error);
                });
        });
        
    // Initialize Select2 for category filter
      $(document).ready(function() {
    $('#categoryFilter').select2({
        placeholder: "All Categories",
        allowClear: true,
        width: '200px', // makes it responsive
        padding: '10px'
    });
      });
    </script>

