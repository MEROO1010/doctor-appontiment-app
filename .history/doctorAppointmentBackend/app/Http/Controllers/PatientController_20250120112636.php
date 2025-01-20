<?php

namespace App\Http\Controllers;


class PatientController extends Controller
{
    // Display a listing of the patients
    public function index()
    {
        $patients = Patient::all();
        return response()->json($patients);
    }

    // Store a newly created patient in storage
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:patients',
            'phone' => 'required|string|max:15',
            'address' => 'required|string|max:255',
        ]);

        $patient = Patient::create($validatedData);
        return response()->json($patient, 201);
    }

    // Display the specified patient
    public function show($id)
    {
        $patient = Patient::findOrFail($id);
        return response()->json($patient);
    }

    // Update the specified patient in storage
    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'email' => 'sometimes|required|string|email|max:255|unique:patients,email,' . $id,
            'phone' => 'sometimes|required|string|max:15',
            'address' => 'sometimes|required|string|max:255',
        ]);

        $patient = Patient::findOrFail($id);
        $patient->update($validatedData);
        return response()->json($patient);
    }

    // Remove the specified patient from storage
    public function destroy($id)
    {
        $patient = Patient::findOrFail($id);
        $patient->delete();
        return response()->json(null, 204);
    }
}