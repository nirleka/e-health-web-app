<?php
/* @var $this UserController */
/* @var $model User */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'user-form',
	'enableAjaxValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'nomor_sip'); ?>
		<?php echo $form->textField($model,'nomor_sip',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'nomor_sip'); ?>
	</div>

    <?php if (!$model->isNewRecord): ?>
    <div class="row">
		<?php echo $form->labelEx($model,'password_lama'); ?>
		<?php echo $form->passwordField($model,'password_lama',array('size'=>50,'maxlength'=>50, 'value' => '')); ?>
		<?php echo $form->error($model,'password_lama'); ?>
	</div>
    <?php endif; ?>

	<div class="row">
		<?php echo $form->labelEx($model,'password'); ?>
		<?php echo $form->passwordField($model,'password', array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'password'); ?>
	</div>

    <div class="row">
		<?php echo $form->labelEx($model,'password_repeat'); ?>
		<?php echo $form->passwordField($model,'password_repeat',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'password_repeat'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'nama'); ?>
		<?php echo $form->textField($model,'nama',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'nama'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'lokasi_penugasan'); ?>
		<?php echo $form->textField($model,'lokasi_penugasan',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'lokasi_penugasan'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'no_telp'); ?>
		<?php echo $form->textField($model,'no_telp',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'no_telp'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'role'); ?>
		<?php echo $form->dropDownList($model,'role', array("1" => "User", "0" => "Admin")); ?>
		<?php echo $form->error($model,'role'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Simpan' : 'Ubah'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->