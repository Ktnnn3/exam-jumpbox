def distribute(num_servers, num_jobs):
    avg_jobs_per_server = num_jobs #num_servers
    num_servers_with_avg_jobs = num_servers
    num_servers_with_extra_job = 0
    num_jobs_for_servers_with_extra_job = 0

    if num_jobs % num_servers != 0:
        num_servers_with_avg_jobs -= (num_servers * avg_jobs_per_server - num_jobs)
        num_servers_with_extra_job = num_servers - num_servers_with_avg_jobs
        num_jobs_for_servers_with_extra_job = num_jobs % num_servers_with_avg_jobs

    servers = [[] for i in range(num_servers)]

    job_index = 0
    for i in range(num_servers_with_extra_job):
        num_jobs_for_server = avg_jobs_per_server + 1 if i < num_jobs_for_servers_with_extra_job else avg_jobs_per_server
        servers[i] = sorted(list(range(job_index, job_index + num_jobs_for_server)))
        job_index += num_jobs_for_server

    for i in range(num_servers_with_extra_job, num_servers):
        servers[i] = sorted(list(range(job_index, job_index + avg_jobs_per_server)))
        job_index += avg_jobs_per_server

    return servers

print(distribute(2, 4)) #[[0, 1], [2, 3]]
print(distribute(3, 3)) #[[0], [1], [2]]
print(distribute(4, 10)) #[[4, 5], [6, 7], [8, 9], [10, 11]]
