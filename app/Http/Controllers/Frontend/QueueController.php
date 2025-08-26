<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;

class QueueController extends Controller
{
    public function jobsqueuecron(Request $request)
    {
        $token = $request->input('token');
        if ($token !== env('CRON_JOB_TOKEN')) {
            return response('Unauthorized', 401);
        }

        Artisan::call('queue:work', [
            '--tries' => 3,
            '--timeout' => 90,
        ]);

        Artisan::call('queue:retry', ['all']);

        return 'Queue worker has been triggered.';
    }

}
