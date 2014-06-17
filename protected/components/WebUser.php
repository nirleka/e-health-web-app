<?php

/**
 * Kelas yang mendefinisikan Yii::app()->user
 *
 * @author Eko Prasetyo<attrib.ada@gmail.com>
 * @property boolean $isSuperAdmin mengecek apakah role pengguna adalah Admin
 */
class WebUser extends CWebUser
{

    /**
     * Overrides a Yii method that is used for roles in controllers (accessRules).
     *
     * @param string $operation Name of the operation required (here, a role).
     * @param mixed $params (opt) Parameters for this operation, usually the object to access.
     * @return bool Permission granted?
     */
    public function checkAccess($operation, $params = array())
    {
        if (empty($this->id))
        {
            // Not identified => no rights
            return false;
        }
        $role = $this->getState("roles");
        if (($role === 'ADM'))
        {
            return true; // admin role has access to everything
        }
        // allow access if the operation request is the current user's role
        return ($operation === $role);
    }

    /**
     * Overide proses login dengan menambahkan $_role dan $_photo
     * @param UserIdentity $identity
     * @param int $duration
     */
    public function login($identity, $duration = 0)
    {
        parent::login($identity, $duration);
        $this->setNickName($identity->getName());
        $this->setNewUser($identity->newUser);
        $this->setAvatar($identity->avatar);
        $this->setIsAdmin((boolean) $identity->getRole());
        $this->setSocialType($identity->socialType);
        $this->setFb($identity->fb);
        $this->setTwitter($identity->twitter);
        $this->setTitle($identity->title);
        $this->setIsAdminLogin(false);
    }

    public function loginAdmin() {
        $this->setIsAdminLogin(true);
    }

    /**
     * getter Yii->app()->user->name
     * @return string
     */
    public function getNickName()
    {
        return $this->getState('__nickName');
    }

    /**
     * setter Yii->app()->user->name
     * @param string $value
     */
    public function setNickName($value)
    {
        $this->setState('__nickName', $value);
    }

    /**
     * getter Yii->app()->user->title
     * @return string
     */
    public function getTitle()
    {
        return $this->getState('__title');
    }

    /**
     * setter Yii->app()->user->title
     * @param string $value
     */
    public function setTitle($value)
    {
        $this->setState('__title', $value);
    }

    /**
     * getter Yii->app()->user->avatar
     * @return string
     */
    public function getAvatar()
    {
        return $this->getState('__avatar');
    }

    /**
     * setter Yii->app()->user->avatar
     * @param string $value
     */
    public function setAvatar($value)
    {
        $this->setState('__avatar', $value);
    }

    /**
     * getter Yii->app()->user->isAdmin
     * @return string role
     */
    public function getIsAdmin()
    {
        return $this->getState('__isAdmin');
    }

    /**
     * setter Yii->app()->user->isAdmin
     * @param string $value
     */
    public function setIsAdmin($value)
    {
        $this->setState('__isAdmin', $value);
    }

    /**
     * getter Yii->app()->user->isAdminLogin
     * @return string role
     */
    public function getIsAdminLogin()
    {
        return $this->getState('__isAdminLogin');
    }

    /**
     * setter Yii->app()->user->isAdminLogin
     * @param string $value
     */
    public function setIsAdminLogin($value)
    {
        $this->setState('__isAdminLogin', $value);
    }

    /**
     * getter Yii->app()->user->NewUser
     * @return string role
     */
    public function getNewUser()
    {
        return $this->getState('__newUser');
    }

    /**
     * setter Yii->app()->user->newUser
     * @param string $value nilay user
     */
    public function setNewUser($value)
    {
        $this->setState('__newUser', $value);
    }

    /**
     * getter Yii->app()->user->socialType
     * @return string role
     */
    public function getSocialType()
    {
        return $this->getState('__socialType');
    }

    /**
     * setter Yii->app()->user->socialType
     * @param string $value
     */
    public function setSocialType($value)
    {
        $this->setState('__socialType', $value);
    }

    /**
     * getter Yii->app()->user->FB
     * @return string role
     */
    public function getFb()
    {
        return $this->getState('__FB');
    }

    /**
     * setter Yii->app()->user->FB
     * @param string $value
     */
    public function setFb($value)
    {
        $this->setState('__FB', !empty($value) ? $value : '');
    }

    /**
     * getter Yii->app()->user->Twitter
     * @return string role
     */
    public function getTwitter()
    {
        return $this->getState('__Twitter');
    }

    /**
     * setter Yii->app()->user->socialType
     * @param string $value
     */
    public function setTwitter($value)
    {
        $this->setState('__Twitter', !empty($value) ? $value : '');
    }

}

/* End of class WebUser */
