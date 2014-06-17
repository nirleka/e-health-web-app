<?php
/* @var $this PenyakitController */
/* @var $model Penyakit */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'penyakit-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'nama'); ?>
		<?php echo $form->textField($model,'nama',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'nama'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'penyebab'); ?>
		<?php echo $form->textArea($model,'penyebab',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'penyebab'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'gejala'); ?>
		<?php echo $form->textArea($model,'gejala',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'gejala'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'diagnosis'); ?>
		<?php echo $form->textArea($model,'diagnosis',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'diagnosis'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->