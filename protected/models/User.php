<?php

/**
 * This is the model class for table "user".
 *
 * The followings are the available columns in table 'user':
 * @property string $id
 * @property string $nomor_sip
 * @property string $password
 * @property string $salt
 * @property string $nama
 * @property string $lokasi_penugasan
 * @property string $no_telp
 * @property string $role
 */
class User extends CActiveRecord
{

    const ADMIN = 0;
    const USER = 1;

    public $password_repeat = '';
    public $password_lama = '';

    /**
     * @return string the associated database table name
     */
    public function tableName()
    {
        return 'user';
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules()
    {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('nomor_sip, password, password_repeat, nama, lokasi_penugasan, no_telp, role', 'required', 'on' => 'create'),
            array('password', 'compare', 'on' => 'create'),

            array('password_lama', 'passwordIsRight', 'on' => 'modify_password'),
            array('password, password_lama, password_repeat', 'required', 'on' => 'modify_password'),

            array('nomor_sip, nama, lokasi_penugasan', 'length', 'max' => 50),
            array('no_telp', 'length', 'max' => 20),
            array('role', 'length', 'max' => 1),
            // The following rule is used by search().
            // @todo Please remove those attributes that should not be searched.
            array('nomor_sip, password, password_repeat, nama, lokasi_penugasan, no_telp, role', 'safe'),
        );
    }

    /**
     * Check apakah password yang digunakan oleh user sesuai dengan yang
     *  ada di db atau tidak
     * @param type $attribute
     * @param type $params
     */
    public function passwordIsRight($attribute, $params)
    {
        $model = $this->findByPk(Yii::app()->user->id, array(
            'select' => 'password, salt',
        ));

        if (!$this->getHashEngine()->CheckPassword($model->salt . $this->password_lama, $model->password))
        {
            $this->addError($attribute, 'Password lama yang anda masukkan salah, Ulangi input');
        }
    }

    /**
     * @return array relational rules.
     */
    public function relations()
    {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels()
    {
        return array(
            'id'               => 'ID',
            'nomor_sip'        => 'Nomor Sip',
            'password'         => 'Password',
            'password_repeat'  => 'Ulang Password',
            'nama'             => 'Nama',
            'lokasi_penugasan' => 'Lokasi Penugasan',
            'no_telp'          => 'No Telp',
            'role'             => 'Role',
        );
    }

    /**
     * Retrieves a list of models based on the current search/filter conditions.
     *
     * Typical usecase:
     * - Initialize the model fields with values from filter form.
     * - Execute this method to get CActiveDataProvider instance which will filter
     * models according to data in model fields.
     * - Pass data provider to CGridView, CListView or any similar widget.
     *
     * @return CActiveDataProvider the data provider that can return the models
     * based on the search/filter conditions.
     */
    public function search()
    {
        // @todo Please modify the following code to remove attributes that should not be searched.

        $criteria = new CDbCriteria;

        $criteria->compare('id', $this->id, true);
        $criteria->compare('nomor_sip', $this->nomor_sip, true);
        $criteria->compare('password', $this->password, true);
        $criteria->compare('nama', $this->nama, true);
        $criteria->compare('lokasi_penugasan', $this->lokasi_penugasan, true);
        $criteria->compare('no_telp', $this->no_telp, true);
        $criteria->compare('role', $this->role, true);

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
        ));
    }

    /**
     * Returns the static model of the specified AR class.
     * Please note that you should have this exact method in all your CActiveRecord descendants!
     * @param string $className active record class name.
     * @return User the static model class
     */
    public static function model($className = __CLASS__)
    {
        return parent::model($className);
    }

    /**
     * 	Membangkitkan nilai salt secara random, dengan menggunakan
     * 	Cryptographically Secure Pseudo-Random Number Generator (CSPRNG)
     * @return string random generated salt
     */
    public function genSalt()
    {
        return (string) bin2hex(mcrypt_create_iv(30, MCRYPT_DEV_URANDOM));
    }

    /**
     * Hash password dengan menggunakan library PasswordHash.
     * Library ini menggunakan bcrypt untuk algoritma hashingnya.
     * @return PasswordHash objek yang bertindak sebagai engine hash
     */
    public function getHashEngine()
    {
        Yii::import('ext.PasswordHash');
        return new PasswordHash(Yii::app()->params['phpass']['iteration_count_log2'], Yii::app()->params['phpass']['portable_hashes']);
    }

    public function saveUser()
    {
        $this->salt = $this->genSalt();
        if ($this->validate()) {
            $this->password = $this->getHashEngine()->HashPassword($this->salt . $this->password);
            return $this->save(false);
        }
        else
            return false;
    }

    public function printRole()
    {
        return $this->role == self::ADMIN ? 'admin' : 'user';
    }

}
