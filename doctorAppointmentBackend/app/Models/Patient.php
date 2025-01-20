<?php

namespace App\Models;


class Patient extends Model
{

    protected $fillable = [
        'first_name',
        'last_name',
        'email',
        'phone_number',
        'date_of_birth',
        'address',
        'gender',
        'medical_history',
    ];

    // Define any relationships here
    public function appointments()
    {
        return $this->hasMany(Appointment::class);
    }
}