struct PS_VERTEX
{
	float4 worldcoordinate : SV_POSITION;
	float4 localcoordinate : POSITION;
	float4 color : COLOR;
};

float4 main(PS_VERTEX input) : SV_TARGET
{
	return input.color;
}