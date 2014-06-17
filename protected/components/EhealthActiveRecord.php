<?php
/**
 * Description of EhealthActiveRecord
 *
 * @author Eko Prasetyo
 */
class EhealthActiveRecord extends CActiveRecord
{
    public function saveToLog($operation, $model)
	{
		$model = new LogData();
        $log = array();

        $model->id_user = 1;
        $log['operation'] = $operation;
        $log['table_name'] = $this->tableName();

		foreach ($this->getAttributes() as $key => $value)
		{
			$log['data'] = array($key => $value);
		}
        $model->log_act = json_encode($log);
		$model->save();
	}

	/**
	 * Menyimpan data ke log Act Setelah operasi delete
	 */
	protected function afterDelete()
	{
		parent::afterDelete();
		$this->saveToLog('delete', $this);
	}

	/**
	 * Menyimpan data ke log Act Setelah operasi simpan
	 */
	protected function afterSave()
	{
		parent::afterSave();

        $operation = '';
        if ($this->isNewRecord) $operation = 'insert';
        else $operation = 'update';

		$this->saveToLog($operation, $this);
	}
}
