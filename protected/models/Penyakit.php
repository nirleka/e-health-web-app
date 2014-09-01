<?php

/**
 * This is the model class for table "penyakit".
 *
 * The followings are the available columns in table 'penyakit':
 * @property string $id
 * @property string $nama
 * @property string $penyebab
 * @property string $gejala
 * @property string $diagnosis
 * @property string $knowledge
 *
 * The followings are the available model relations:
 * @property Obat[] $obats
 */
class Penyakit extends EhealthActiveRecord
{
	public $obatsIDs = array();

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'penyakit';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nama, penyebab, gejala, diagnosis', 'required'),
			array('nama', 'length', 'max'=>50),
			array('obatsIDs, nama, gejala, diagnosis, knowledge, penyebab', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, nama, penyebab, gejala, diagnosis', 'safe', 'on'=>'search'),
		);
	}

	public function behaviors(){
		return array( 'CAdvancedArBehavior' => array(
			'class' => 'application.extensions.CAdvancedArBehavior')
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'obats' => array(self::MANY_MANY, 'Obat', 'penyakit_has_obat(id_penyakit, id_obat)'),
		);
	}

	public function afterFind()
	{
		$listObat = Yii::app()->db->createCommand()->select('id_obat')
												   ->from('penyakit_has_obat')
												   ->where('id_penyakit = :id', array(':id' => $this->id))
												   ->queryAll();

		foreach ($listObat as $value) {
			$this->obatsIDs[] = $value['id_obat'];
		}
	}

	public function getObatName()
    {
        $names = array();
        foreach($this->obats as $obat) {
            $names[] = $obat->nama."<br>";
        }
        return implode("\n", $names);
    }

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nama' => 'Nama',
			'penyebab' => 'Penyebab',
			'gejala' => 'Gejala',
			'diagnosis' => 'Diagnosis',
			'knowledge' => 'Knowledge',
			'obatsIDs' => 'Daftar Obat',
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

		$criteria=new CDbCriteria;

		$criteria->compare('nama',$this->nama,true);
		$criteria->compare('penyebab',$this->penyebab,true);
		$criteria->compare('gejala',$this->gejala,true);
		$criteria->compare('diagnosis',$this->diagnosis,true);
		$criteria->compare('knowledge',$this->diagnosis,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Penyakit the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
