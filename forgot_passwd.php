<div class="right">
    <form action="" method="post" id="formDemo" class="form">
        <div class="form-login">
            <table>
                <tr>
                    <?php
                    require_once 'classes/Users.php';
                    if (isset($_POST['submit'])) {
                        $error = array();
                        $email = $_POST['email'];
                        if ($email == '') {
                            $error['email'] = 'Không được để trống';
                        }
                        if (empty($error)) {
                            $result = $users->getUserEmail($email);
                            $code = substr(rand(0,999999),0,6);
                            $title = 'Quên mật khẩu';
                            $content = "Mã xác nhận của bạn là: <span style='color:green'>".$code."</span>";
                            $mail->sendMail($title, $content, $email);

                            $_SESSION['email'] = $email;
                            $_SESSION['code'] = $code;
                            echo '<script>location.href = "./?p=verification";</script>';
                        }
                    }
                    ?>
                </tr>
                <tr>
                    <p style="margin-bottom: 20px" class="title">Quên mật khẩu</p>
                </tr>
                <tr>
                    <input type="email" class="control-login" name="email" placeholder="Nhập email">
                    <span style="color: red"><?php if (isset($error['email'])) echo $error['email'] ?></span><br><br>
                </tr>

                <tr><br>
                    <div class="login">
                        <button class="login btn btn-light" type="submit" name="submit">Gửi yêu cầu</button>
                    </div>
                </tr>

            </table>
        </div>
    </form>
</div>