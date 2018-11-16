struct VS_VERTEX
{
	float4 coordinate : POSITION;
	float4 color : COLOR;
	float2 uv : UV;
	float4 normal : NORMAL;
};

struct PS_VERTEX
{
	float4 coordinate : SV_POSITION;
	float4 color : COLOR;
};

cbuffer CAMERA : register(b0)
{
	matrix cworld;
	matrix clocal;
	matrix cprojection;
}; 

cbuffer TRANSFORM : register(b1)
{
	matrix tworld;
	matrix tlocal;
};

PS_VERTEX main(VS_VERTEX fromVertexBuffer )
{
	PS_VERTEX sendToRasterizer = (PS_VERTEX)0;

	matrix local = mul(tlocal, tworld);

	sendToRasterizer.coordinate = mul(fromVertexBuffer.coordinate, local);
	sendToRasterizer.coordinate = mul(sendToRasterizer.coordinate, clocal);
	sendToRasterizer.coordinate = mul(sendToRasterizer.coordinate, cprojection);

	sendToRasterizer.color = fromVertexBuffer.color;

	return sendToRasterizer;


}