<script>
  $(document).ready(function() {
    $('#p_use').click(function() {
      uni_modal("Privacy Policy", "policy.php", "mid-large")
    })
    window.viewer_modal = function($src = '') {
      start_loader()
      var t = $src.split('.')
      t = t[1]
      if (t == 'mp4') {
        var view = $("<video src='" + $src + "' controls autoplay></video>")
      } else {
        var view = $("<img src='" + $src + "' />")
      }
      $('#viewer_modal .modal-content video,#viewer_modal .modal-content img').remove()
      $('#viewer_modal .modal-content').append(view)
      $('#viewer_modal').modal({
        show: true,
        backdrop: 'static',
        keyboard: false,
        focus: true
      })
      end_loader()

    }
    window.uni_modal = function($title = '', $url = '', $size = "") {
      start_loader()
      $.ajax({
        url: $url,
        error: err => {
          console.log()
          alert("An error occured")
        },
        success: function(resp) {
          if (resp) {
            $('#uni_modal .modal-title').html($title)
            $('#uni_modal .modal-body').html(resp)
            if ($size != '') {
              $('#uni_modal .modal-dialog').addClass($size + '  modal-dialog-centered')
            } else {
              $('#uni_modal .modal-dialog').removeAttr("class").addClass("modal-dialog modal-md modal-dialog-centered")
            }
            $('#uni_modal').modal({
              show: true,
              backdrop: 'static',
              keyboard: false,
              focus: true
            })
            end_loader()
          }
        }
      })
    }
    window._conf = function($msg = '', $func = '', $params = []) {
      $('#confirm_modal #confirm').attr('onclick', $func + "(" + $params.join(',') + ")")
      $('#confirm_modal .modal-body').html($msg)
      $('#confirm_modal').modal('show')
    }
  })
</script>
<!-- Footer-->
<footer class="py-5 bg-dark border-top shadow-lg">
  <div class="container text-white">
    <div class="row" style="border-bottom: 1px dashed">
      <div class="col-md-3 contact">
        <h5>Hỗ trợ khách hàng</h5>
        <p class="m-0">Hotline: <b>0243.775.5620 | 0912.269.229</b></p>
        <span>(8h - 21h / T2 - T7)</span>
        <p><i class="fa fa-envelope"></i> <a href="contact@nhasachminhthang.vn">contact@nhasachminhthang.vn</a></p>
      </div>

      <div class="col-md-3 question">
        <h5>Hỏi đáp</h5>
        <ul class="p-0" style="list-style-type:none;">
          <li><a href="#"></a>Các câu hỏi phổ biến</li>
          <li><a href="#"></a>Gửi câu hỏi</li>
          <li><a href="#"></a>Tin tức</li>
          <li><a href="#"></a>Liên hệ</li>
        </ul>
      </div>

      <div class="col-md-3 help">
        <h5>Trợ giúp</h5>
        <ul class="p-0" style="list-style-type:none;">
          <li><a href="#"></a>Hướng dẫn tải đĩa CD</li>
          <li><a href="#"></a>Hướng dẫn đặt hàng</li>
          <li><a href="#"></a>Xác nhận đơn hàng</li>
          <li><a href="#"></a>Hướng dẫn thanh toán</li>
          <li><a href="#"></a>Phương thức vận chuyển</li>
          <li><a href="#"></a>Chính sách bảo mật thông tin</li>
          <li><a href="#"></a>Download danh mục sách độc quyền</li>
        </ul>
      </div>

      <div class="col-md-3 fanpage">
        <div class="footer_facebook_ff">
          <iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fnhasachminhthang808duonglang&amp;width=270&amp;height=290&amp;colorscheme=light&amp;show_faces=true&amp;header=true&amp;stream=false&amp;show_border=true" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 270px;
    height: 230px;" allowtransparency="true"></iframe>
        </div>
      </div>
    </div>

    <div class="row mt-2">
      <div class="col-md-7">
        <p class="m-0">Bản quyền thuộc về &copy; <?php echo $_settings->info('short_name') ?> 2022</p>
        <p class="m-0">Thiết kế bởi <a href="mailto:taphamducanh@gmail.com">Duc Anh's group</a></p>
      </div>

      <div class="col-md-5 visible-md-block visible-lg-block">
        <div class="footer-certificate-box">
          <a title="Chứng nhận sàn giao dịch TMĐT" href="http://online.gov.vn/Home/WebDetails/21505" class="footer-trust">
            <span>Được chứng nhận</span>
            <img alt="Chứng nhận WEBSITE THƯƠNG MẠI ĐIỆN TỬ" src="../assets/images/seal-ecommerce.png" class="img-responsive">
          </a>
          <a title="Thanh toán an toàn trên Tiki.vn" href="#" class="footer-payment">
            <span>Cách thức thanh toán</span>
            <img alt="Thanh toán an toàn trên Tiki.vn" src="../assets/images/safe.jpg" class="img-responsive">
          </a>
        </div>
      </div>
    </div>
  </div>
</footer>


<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="<?php echo base_url ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="<?php echo base_url ?>plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="<?php echo base_url ?>plugins/sparklines/sparkline.js"></script>
<!-- Select2 -->
<script src="<?php echo base_url ?>plugins/select2/js/select2.full.min.js"></script>
<!-- JQVMap -->
<script src="<?php echo base_url ?>plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="<?php echo base_url ?>plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="<?php echo base_url ?>plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="<?php echo base_url ?>plugins/moment/moment.min.js"></script>
<script src="<?php echo base_url ?>plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="<?php echo base_url ?>plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="<?php echo base_url ?>plugins/summernote/summernote-bs4.min.js"></script>
<script src="<?php echo base_url ?>plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<?php echo base_url ?>plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<?php echo base_url ?>plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="<?php echo base_url ?>plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- overlayScrollbars -->
<!-- <script src="<?php echo base_url ?>plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script> -->
<!-- AdminLTE App -->
<script src="<?php echo base_url ?>dist/js/adminlte.js"></script>
<div class="daterangepicker ltr show-ranges opensright">
  <div class="ranges">
    <ul>
      <li data-range-key="Today">Today</li>
      <li data-range-key="Yesterday">Yesterday</li>
      <li data-range-key="Last 7 Days">Last 7 Days</li>
      <li data-range-key="Last 30 Days">Last 30 Days</li>
      <li data-range-key="This Month">This Month</li>
      <li data-range-key="Last Month">Last Month</li>
      <li data-range-key="Custom Range">Custom Range</li>
    </ul>
  </div>
  <div class="drp-calendar left">
    <div class="calendar-table"></div>
    <div class="calendar-time" style="display: none;"></div>
  </div>
  <div class="drp-calendar right">
    <div class="calendar-table"></div>
    <div class="calendar-time" style="display: none;"></div>
  </div>
  <div class="drp-buttons"><span class="drp-selected"></span><button class="cancelBtn btn btn-sm btn-default" type="button">Cancel</button><button class="applyBtn btn btn-sm btn-primary" disabled="disabled" type="button">Apply</button> </div>
</div>
<div class="jqvmap-label" style="display: none; left: 1093.83px; top: 394.361px;">Idaho</div>