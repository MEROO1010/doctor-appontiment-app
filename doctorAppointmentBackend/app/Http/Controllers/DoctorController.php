<?php

namespace App\Http\Controllers;


class DoctorController extends Controller
{
    // Display a listing of the doctors
    public function index()
    {
        $doctors = Doctor::all();
        return response()->json($doctors);
    }

    // Store a newly created doctor in storage
    public function store(Request $request)
    {
        $doctor = new Doctor();
        $doctor->name = $request->name;
        $doctor->specialization = $request->specialization;
        $doctor->phone = $request->phone;
        $doctor->email = $request->email;
        $doctor->save();

        return response()->json($doctor, 201);
    }

    // Display the specified doctor
    public function show($id)
    {
        $doctor = Doctor::find($id);
        if ($doctor) {
            return response()->json($doctor);
        } else {
            return response()->json(['message' => 'Doctor not found'], 404);
        }
    }

    // Update the specified doctor in storage
    public function update(Request $request, $id)
    {
        $doctor = Doctor::find($id);
        if ($doctor) {
            $doctor->name = $request->name;
            $doctor->specialization = $request->specialization;
            $doctor->phone = $request->phone;
            $doctor->email = $request->email;
            $doctor->save();

            return response()->json($doctor);
        } else {
            return response()->json(['message' => 'Doctor not found'], 404);
        }
    }

    // Remove the specified doctor from storage
    public function destroy($id)
    {
        $doctor = Doctor::find($id);
        if ($doctor) {
            $doctor->delete();
            return response()->json(['message' => 'Doctor deleted']);
        } else {
            return response()->json(['message' => 'Doctor not found'], 404);
        }
    }
}