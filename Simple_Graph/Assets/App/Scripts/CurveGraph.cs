using UnityEngine;

public class CurveGraph : MonoBehaviour
{
    [SerializeField]
    private Transform pointPrefab;

    [SerializeField]
    private int resolution = 50;

    [SerializeField]
    private float length = 10;

    private void Start()
    {
        // XPower2();
        // XPower3();
        Sin();
    }

    private void XPower2()
    {
        var step = length / resolution;
        var initValue = -length / 2;

        for (var i = 0; i <= resolution; i++)
        {
            var point = GameObject.Instantiate(pointPrefab);
            var localPos = point.localPosition;
            var x = initValue + step * i;
            
            localPos.x = x;
            localPos.y = x * x;
            localPos.z = 0;

            point.localPosition = localPos;
            point.localScale = new(0.1f, 0.1f, 0.1f);
            point.parent = this.transform;
        }
    }

    private void XPower3()
    {
        var step = length / resolution;
        var initValue = -length / 2;

        for (var i = 0; i <= resolution; i++)
        {
            var point = GameObject.Instantiate(pointPrefab);
            var localPos = point.localPosition;
            var x = initValue + step * i;
            
            localPos.x = x;
            localPos.y = x * x * x;
            localPos.z = 0;

            point.localPosition = localPos;
            point.localScale = new(0.1f, 0.1f, 0.1f);
            point.parent = this.transform;
        }
    }

    private void Sin()
    {
        var degree = 360 / resolution;
        
        for (var i = 0; i <= resolution; i++)
        {
            var point = GameObject.Instantiate(pointPrefab);
            var localPos = point.localPosition;
            var d = degree * i;
            
            localPos.x = d / 28f;
            localPos.y = Mathf.Sin(d / 28f);
            localPos.z = 0;

            point.localPosition = localPos;
            point.localScale = new(0.1f, 0.1f, 0.1f);
            point.parent = this.transform;
        }
    }
}