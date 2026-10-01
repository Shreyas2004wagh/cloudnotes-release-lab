# Release Notes — CloudNotes Release Lab

Fill in this template as you diagnose and fix each of the three planted faults.

## Task 1 — Terraform/HCL validation fault

**Original error (paste `terraform validate` output):**

```
changed the files then saw this posting the resulting result below here , rest given in the document which will be submitted
```

**Root cause:**

<explain>

**Fix applied:**

<describe the change>

var.bucket_name_old was undeclared ; replacing it with the declared var.bucket_name fixes the reference .

**Evidence (clean validate output):**

```
Success! The configuration is valid.
```

---

## Task 2 — Reusable module + state isolation fault

**Original problem:**

<describe what was duplicated / misconfigured>

**Fix applied:**

<describe the change — module call + unique backend paths>

Seperate state files prevent dev and staging from interfering with each other . A remote backend lets teams share state consistently and , when supported , lock it against concurrent changes.


---

## Task 3 — Container build + secret fault

**Original error (paste `docker build` output):**

```
<paste here>
```

**Root cause:**

<explain>

**Fix applied:**

<describe the Dockerfile / compose changes>

 A multi stage build keeps unnecessaty build files out of the runtime image, reducing size and attack surface. Secrets must be supplied at runtime because the hardcoded values can be recovered from image layers.

**Evidence (`curl http://localhost:8080/health`):**

```
given in the document
```


