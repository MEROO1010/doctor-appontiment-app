<?php

namespace App\Models;


class Appointment extends Model
{
    // Table name
    protected $table = 'appointments';

    // Fillable fields
    protected $fillable = [
        'doctor_id',
        'patient_id',
        'appointment_date',
        'status',
        'notes'
    ];

    // Relationships
    public function doctor()
    {
        return $this->belongsTo('App\Models\Doctor');
    }

    public function patient()
    {
        return $this->belongsTo('App\Models\Patient');
    }
}