<?php

namespace App\Models;


class Doctor extends Model
{

    protected $fillable = [
        'name',
        'specialization',
        'email',
        'phone',
        'address',
    ];

    public function appointments()
    {
        return $this->hasMany(Appointment::class);
    }
}