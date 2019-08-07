<?php

class DB
{
    use Element;
    use Singleton;

    public static $transaction;
    function __construct()
    {
        $this->sql = '';


        self::$transaction = [
            'begin' => function () {
                return $this->conn->begin_transaction();
            },
            'rollback' => function () {
                return $this->conn->rollback();
            },
            'commit' => function () {
                return $this->conn->commit();
            }
        ];
    }

    function connect($hostname, $username, $password, $database, $port = null, $socket = null)
    {
        $this->setArgs(
            array(
                'hostname' => $hostname,
                'username' => $username,
                'password' => $password,
                'database' => $database,
                'port'     => $port,
                'socket'   => $socket
            )
        );

        // Create connection
        $conn = new mysqli($this->hostname, $this->username, $this->password, $this->database, $this->port, $this->socket);
        // Check connection
        if ($conn->connect_error) {
            throw new Exception("Connection failed: " . $conn->connect_error);
        }

        $this->conn = $conn;
        return $this;
    }

    function is_connected()
    {
        if (!isset($this->conn)) {
            throw new Exception('Database is not defined.');
        }
        if (!isset($this->sql) || $this->sql == '') {
            throw new Exception('SQL is not defined.');
        }
    }

    function __destruct()
    {
        if (isset($this->conn)) {
            $this->conn->close();
        }
    }

    /////////////////////
    // Security   //////
    ////////////////////

    function cleaninput($str)
    {
        return $this->conn->real_escape_string($str);
    }

    //////////////////////
    ///  SELECT /////////
    /////////////////////
    function query()
    {
        $this->is_connected();

        $result = $this->conn->query($this->sql);

        if (!empty($this->conn->error)) {
            return error_sql($this->conn->error);
        }

        return $result;
    }

    function fetch_object()
    {
        $data = [];
        $result = $this->query();
        while ($row = $result->fetch_object()) {
            $data[] = $row;
        }
        return $data;
    }

    function fetch_assoc()
    {
        $data = [];
        $result = $this->query();
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        return $data;
    }

    function fetch_array()
    {
        $data = [];
        $result = $this->query();
        while ($row = $result->fetch_array()) {
            $data[] = $row;
        }
        return $data;
    }

    //////////////////////////////
    ///  INSERT / UPDATE /////////
    //////////////////////////////

    function execute()
    {
        $this->is_connected();
        $result = $this->conn->query($this->sql);
        if (!empty($this->conn->error)) {
            //return error_sql($this->conn->error);
            return $this->conn->error;
        }
        return $this->conn->affected_rows;
    }

    function insert_id()
    {
        return $this->conn->insert_id;
    }

    function insertvalues($tablename, $data)
    {
        $strkey = " ( ";
        $valuestr = " VALUES (";
        foreach ($data as $key => $value) {
            $strkey .= " `" . $key . "` ,";
            $valuestr .= " '" . $this->cleaninput($value) . "' ,";
        }
        $strkey = substr($strkey, 0, -1);
        $valuestr = substr($valuestr, 0, -1);
        $strkey .= " ) ";
        $valuestr .= " ) ";

        $this->sql = "INSERT INTO `$tablename` $strkey $valuestr";

        return $this;
    }

    function insert($tablename, $data, $unique = [])
    {
        $strkey = " ( ";
        $valuestr = " SELECT ";
        $uniqueqry = "";
        foreach ($data as $key => $value) {
            if (in_array($key, $unique)) {
                $uniqueqry .= " `$key` = '" . $this->cleaninput($value) . "' OR";
            }

            $strkey .= " `" . $key . "` ,";
            $valuestr .= " '" . $this->cleaninput($value) . "' ,";
        }
        $strkey = substr($strkey, 0, -1);
        $valuestr = substr($valuestr, 0, -1);
        $strkey .= " ) ";
        $valuestr .= " ";


        if (strlen($uniqueqry) > 0) {
            $uniqueqry = substr($uniqueqry, 0, -2);
            $uniqueqry = " WHERE  NOT EXISTS
                        ( SELECT * FROM `$tablename` WHERE " . $uniqueqry . " ) ";
        }
        $this->sql = "INSERT INTO `$tablename` $strkey $valuestr $uniqueqry";

        return $this;
    }

    function insertorupdate($tablename, $data)
    {
        $strkey = " ( ";
        $valuestr = " VALUES (";
        $updateqry = "";
        foreach ($data as $key => $value) {
            $strkey .= " `" . $key . "` ,";
            $valuestr .= " '" . $this->cleaninput($value) . "' ,";
            $updateqry .= " `$key` = VALUES($key),";
        }
        $strkey = substr($strkey, 0, -1);
        $valuestr = substr($valuestr, 0, -1);
        //$updateqry = substr($updateqry,0, -1);
        $updateqry .= " id = LAST_INSERT_ID(id) ";
        $strkey .= " ) ";
        $valuestr .= " ) ";

        $this->sql = "INSERT INTO `$tablename` $strkey $valuestr
                      ON DUPLICATE KEY UPDATE $updateqry";

        return $this;
    }

    /////////////////////////////////
    ////// Query Making ////////////
    /////////////////////////////
    function delete()
    {
        $this->sql .= "DELETE ";
        return $this;
    }

    function select(string $str = "*")
    {
        $this->sql .= "SELECT $str ";
        return $this;
    }

    function from(string $tablename)
    {
        $this->sql .= " FROM `$tablename` ";
        return $this;
    }

    function where(string $str)
    {
        $this->sql .= " WHERE $str ";
        return $this;
    }

    function groupby(string $str)
    {
        $this->sql .= " GROUP BY $str ";
        return $this;
    }

    function orderby(string $str, string $order = "ASC")
    {
        $this->sql .= " ORDER BY $str $order";
        return $this;
    }

    function limit(int $from, int $to)
    {
        $this->sql .= " LIMIT $from, $to ";
        return $this;
    }

    function begin_transaction()
    {
        return $this->conn->begin_transaction();
    }

    function rollback()
    {
        return $this->conn->rollback();
    }

    public function commit()
    {
        return $this->conn->commit();
    }
}
