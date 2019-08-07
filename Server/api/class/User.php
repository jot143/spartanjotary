<?php

class User
{
    private $tablename = 'users';
    private $model = false;

    public function __construct()
    { }

    private function model()
    {
        if ($this->model === false) return $this->model = new Model($this->tablename);
        return $this->model;
    }

    public function login($args)
    {
        if (isset($args['email'], $args['password'])) {

            $args['email'] = trim(strtolower($args['email']));

            if (!filter_var($args['email'], FILTER_VALIDATE_EMAIL)) {
                return reply('Invaild Email');
            }

            $user = $this->model()->getSelfBy(['email' => $args['email'], 'password' => md5($args['password'])]);
            if ($user) {

                return reply("Login Successfully", "success", $user[0]);
            }

            return reply("Invaild email address");
        }

        return reply("Please fill vaild email");
    }


    function getAll()
    {
        $obj = $this->model();
        return ['status' => 'success', 'data' => $obj->getAll()];
    }

    public function signup($args)
    {
        if (isset($args['email'])) {

            $args['email'] = trim(strtolower($args['email']));

            if (!filter_var($args['email'], FILTER_VALIDATE_EMAIL)) {
                return reply('Invaild Email');
            }

            $user = $this->model()->getSelfBy(['email' => $args['email']]);
            if ($user === false) {
                // Genrate Password
                $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                $length = 6;
                $string = '';

                for ($i = 0; $i < $length; $i++) {
                    $string .= $characters[mt_rand(0, strlen($characters) - 1)];
                }

                $password = md5($string);

                $res = $this->model()->insert([
                    'email' => $args['email'],
                    'password' => $password,
                    'create_datetime' => date('Y-m-d h-i-s')
                ]);

                if (is_int($res) && $res > 0) {
                    $subject = 'Welocome To HotSlice';
                    $message = '<html><body>';
                    $message .= "Hi <br><br> Thank you for joining Hotslice.<br><br>";
                    $message .= "Your Password: " . $string . "<br/>";
                    $message .= "Regards,<br><br> Hotslice Team.<br><br><br>";
                    $message .= "<span style='color:silver;padding:40px;text-align:right;'>Copyright © 2017 Hotslice, Inc. All 
                                rights reserved.</span>";
                    $message .= '</body></html>';

                    sendSimpleEmail($args['email'], $subject, $message);

                    return reply("Register Successfully, Please check your email inbox/junk.", "success", ['id' => $res]);
                }
            }

            return reply("Email already register with us");
        }

        return reply("Please fill vaild email");
    }


    public function resetpassword($args)
    {
        if (isset($args['email'])) {

            $args['email'] = trim(strtolower($args['email']));

            if (!filter_var($args['email'], FILTER_VALIDATE_EMAIL)) {
                return reply('Invaild Email');
            }

            $user = $this->model()->getSelfBy(['email' => $args['email']]);
            if ($user) {
                // Genrate Password
                $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                $length = 6;
                $string = '';

                for ($i = 0; $i < $length; $i++) {
                    $string .= $characters[mt_rand(0, strlen($characters) - 1)];
                }

                $password = md5($string);

                $res = $this->model()->updateMe([
                    'password' => $password
                ]);

                if ($res) {
                    $subject = 'HotSlice | Your New Password';
                    $message = '<html><body>';
                    $message .= "Hi <br><br> Please check your new password.<br><br>";
                    $message .= "Your Password: " . $string . "<br/>";
                    $message .= "Regards,<br><br> Hotslice Team.<br><br><br>";
                    $message .= "<span style='color:silver;padding:40px;text-align:right;'>Copyright © 2017 Hotslice, Inc. All 
                                rights reserved.</span>";
                    $message .= '</body></html>';

                    sendSimpleEmail($args['email'], $subject, $message);

                    return reply("Please check new password in your email inbox/junk.", "success", ['id' => $res]);
                }
            }

            return reply("Email not register with us");
        }

        return reply("Please fill vaild email");
    }


    /**
     * user profile functions start.
     */
    public function syncProfile()
    {
        if (isset($_POST['id'])) {
            $user = $this->getProfile($_POST['id']);
            if ($user !== false) {
                $data = array('status' => 'success', 'msg' => 'Profile Detail', 'data' => $user);

                return $data;
            } else {
                $data = array('status' => 'error', 'msg' => 'User not exit');

                return $data;
            }
        }
        $data = array('status' => 'error', 'msg' => 'Please fill all fields');

        return $data;
    }

    public function updateProfile()
    {
        if (isset($_POST['firstname'], $_POST['lastname'], $_POST['email'], $_POST['id'])) {
            $user = $this->getSelf($_POST['id']);
            if ($user) {
                $data = array(
                    'firstname' => $_POST['firstname'],
                    'lastname' => $_POST['lastname'],
                    'email' => $_POST['email'],
                );

                if ($this->updateMe($data)) {
                    $data = array('status' => 'success', 'msg' => 'Profile Update', 'data' => $user);

                    return $data;
                }

                $data = array('status' => 'success', 'msg' => 'Profile Failed');

                return $data;
            }
        }
        $data = array('status' => 'error', 'msg' => 'Please fill all fields');

        return $data;
    }

    public function updateprofilepic()
    {
        if ($_FILES['file']['error'] > 0) {
            $data = array('status' => 'error', 'msg' => $_FILES['file']['error']);

            return $data;
        }
        if (isset($_POST['id'], $_FILES['file'])) {
            if ($this->getSelf($_POST['id'])) {
                $id = $_POST['id'];
                $file = $_FILES['file'];
                $meta_value = $this->upload_file($file);
                $data = array('profilepic' => "$meta_value");
                if ($this->updateMe($data)) {
                    $data = array('status' => 'success', 'msg' => 'Profile Update', 'data' => $meta_value);

                    return $data;
                }
                $data = array('status' => 'success', 'msg' => 'Profile Failed');

                return $data;
            }
        }
        $data = array('status' => 'error', 'msg' => 'Please fill all fields');

        return $data;
    }



    public function addNew($mobile, $uuid, $country, $playerId)
    {
        $updateData = array(
            'uuid' => '12345678',
            'playerid' => '12345678',
        );
        $where = "playerid = '$playerId'";
        $this->updateByMeta($updateData, $where);

        return $this->createUpdate(['mobile' => $mobile, 'uuid' => $uuid, 'playerid' => $playerId, 'country' => $country]);
    }

    public function forgetPassword()
    {
        if (isset($_POST['id'])) {
            $id = $_POST['id'];

            if (($id) && (!empty($id))) {
                $userdata = $this->getSelfBy(['id' => "$id"]);

                if ($userdata) {
                    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

                    $length = 6;

                    $string = '';

                    for ($i = 0; $i < $length; ++$i) {
                        $string .= $characters[mt_rand(0, strlen($characters) - 1)];
                    }

                    $password = md5($string);

                    $result = $this->updateMe(['password' => $password]);

                    $subject = 'Your New Password';

                    $message = '<html><body>';

                    $message .= 'Your Password: ' . $string . '<br/>';

                    $message .= 'Regards,<br><br> Tawnup Team.<br><br><br>';

                    $message .= "<span style='color:silver;padding:40px;text-align:right;'>Copyright © 2017 Tawnup, Inc. All 

                                rights reserved.</span>";

                    $message .= '</body></html>';

                    $this->sendmail($userdata[0]->email, $password, $subject, $message);

                    $data = array('status' => 'success', 'msg' => 'New password mail sent');

                    return $data;
                } else {
                    $data = array('status' => 'failed', 'msg' => 'Invalid user id');

                    return $data;
                }
            }
        }

        $data = array('status' => 'failed', 'msg' => 'Invalid user id');

        return $data;
    }
}
