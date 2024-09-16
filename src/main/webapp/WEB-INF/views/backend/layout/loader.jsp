<div id="loader">
  <div class="spinner"></div>
</div>

<script>
  window.addEventListener('load', function load() {
    const loader = document.getElementById('loader');
    setTimeout(function() {
      loader.classList.add('fadeOut');
    }, 300);
  });
</script>