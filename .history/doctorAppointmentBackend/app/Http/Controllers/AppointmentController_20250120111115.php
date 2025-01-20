


public function index()
{
    return Appointment::with('doctor', 'patient')->get();
}

public function store(Request $request)
{
    $request->validate([
        'doctor_id' => 'required|exists:doctors,id',
        'patient_id' => 'required|exists:patients,id',
        'appointment_date' => 'required|date',
    ]);

    $appointment = Appointment::create($request->all());
    return response()->json($appointment, 201);
}
public function show($id)
{
    return Appointment::with('doctor', 'patient')->find($id);
}

public function update(Request $request, $id)
{
    $appointment = Appointment::findOrFail($id);
    $appointment->update($request->all());
    return response()->json($appointment, 200);
}

public function destroy($id)
{
    Appointment::destroy($id);
    return response()->json(null, 204);
}




