<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 *
 * Model Home_model
 *
 * This Model for ...
 * 
 * @package		CodeIgniter
 * @category	Model
 * @author    Muhamad Taopik <muhamadtaopik007@gmail.com>
 * @link      https://github.com/Mr94t3z
 * @param     ...
 * @return    ...
 *
 */

class Home_model extends CI_Model
{

    public function total($table)
    {
        return $this->db->get($table)->num_rows();
    }
}

/* End of file Home_model.php */
/* Location: ./application/models/Home_model.php */
