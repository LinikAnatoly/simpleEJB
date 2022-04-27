
unit EditENRoadTypeDataFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRoadTypeDataController ;

type
  TfrmENRoadTypeDataFilterEdit = class(TDialogForm)

    lblSpeed : TLabel;
    edtSpeed: TEdit;
    lblDistance : TLabel;
    edtDistance: TEdit;
    lblIsWinter : TLabel;
    edtIsWinter: TEdit;
    lblCoeff : TLabel;
    edtCoeff: TEdit;


  HTTPRIOENRoadTypeData: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENRoadTypeDataFilterEdit: TfrmENRoadTypeDataFilterEdit;
  ENRoadTypeDataFilterObj: ENRoadTypeDataFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENRoadTypeDataController  ;
}
{$R *.dfm}



procedure TfrmENRoadTypeDataFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtSpeed
      ,edtDistance
      ,edtIsWinter
      ,edtCoeff
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENRoadTypeDataObj.speed <> nil ) then
       edtSpeed.Text := ENRoadTypeDataObj.speed.decimalString
    else
       edtSpeed.Text := ''; 



    if ( ENRoadTypeDataObj.distance <> nil ) then
       edtDistance.Text := ENRoadTypeDataObj.distance.decimalString
    else
       edtDistance.Text := ''; 



    if ( ENRoadTypeDataObj.isWinter <> Low(Integer) ) then
       edtIsWinter.Text := IntToStr(ENRoadTypeDataObj.isWinter)
    else
       edtIsWinter.Text := '';



    if ( ENRoadTypeDataObj.coeff <> nil ) then
       edtCoeff.Text := ENRoadTypeDataObj.coeff.decimalString
    else
       edtCoeff.Text := ''; 


  end;

}

end;



procedure TfrmENRoadTypeDataFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRoadTypeData: ENRoadTypeDataControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENRoadTypeDataFilterObj.speed = nil ) then
       ENRoadTypeDataFilterObj.speed := TXSDecimal.Create;
     ENRoadTypeDataFilterObj.speed.decimalString := edtSpeed.Text ;



     if (ENRoadTypeDataFilterObj.distance = nil ) then
       ENRoadTypeDataFilterObj.distance := TXSDecimal.Create;
     ENRoadTypeDataFilterObj.distance.decimalString := edtDistance.Text ;



     if ( edtIsWinter.Text <> '' ) then
       ENRoadTypeDataFilterObj.isWinter := StrToInt(edtIsWinter.Text)
     else
       ENRoadTypeDataFilterObj.isWinter := Low(Integer) ;




     if (ENRoadTypeDataFilterObj.coeff = nil ) then
       ENRoadTypeDataFilterObj.coeff := TXSDecimal.Create;
     ENRoadTypeDataFilterObj.coeff.decimalString := edtCoeff.Text ;




  end;
end;




end.