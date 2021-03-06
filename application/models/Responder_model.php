<?php
    class Responder_model extends CI_Model {
        public function __construct() {
            $this->load->database();
        }

        public function add($orgId, $isAdmin = 0) {
            $password = $this->input->post('password');
            $hashedPw = password_hash($password, PASSWORD_BCRYPT);

            $responderData = array(
                'org_id' => $orgId,
                'first_name' => htmlspecialchars($this->input->post('first-name')),
                'last_name' => htmlspecialchars($this->input->post('last-name')),
                'position' => htmlspecialchars($this->input->post('position')),
                'password' => htmlspecialchars($hashedPw),
                'contact' => htmlspecialchars($this->input->post('contact')),
                'email' => htmlspecialchars($this->input->post('email')),
                'is_admin' => $isAdmin
            );

            return $this->db->insert('responders', $responderData);
        }

        public function getResponders($orgId, $searchValue, $searchType) {
            $query = $this->db->get_where('responders', array('org_id' => $orgId, $searchType => $searchValue));
            return $query->result();
        }

        public function getRespondersOf($incidentId, $orgId) {
            $query = $this->db->get_where('responders', array('org_id' => $orgId, 'responding_to' => (int) $incidentId));
            return $query->result();
        }

        public function getAvailableRespondersOf($orgId, $searchType, $searchValue) {
            if ($searchType === 'all') {
                $query = $this->db->get_where('responders', array('org_id' => $orgId, 'is_available' => '1'));
            } else {
                $query = $this->db->get_where('responders', array('org_id' => $orgId, 'is_available' => '1', $searchType => $searchValue));
            }
            return $query->result();
        }

        public function makeAdmin($orgId, $responderId) {
            $this->db->where('is_admin', '1');
            $this->db->where('org_id', $orgId);
            if ($this->db->update('responders', array('is_admin'=> '0'))) {
                $this->db->where('id', $responderId);
                return $this->db->update('responders', array('is_admin'=> '1'));
            }

            return false;
        }

        public function assignToIncident($incidentId, $responderId) {
            $this->db->where('id', $responderId);
            return $this->db->update('responders', array('responding_to'=> $incidentId, 'is_available' => '0'));
        }

        public function delete($responderId) {
            $this->db->where('id', $responderId);
            return $this->db->delete('responders');
        }
    }