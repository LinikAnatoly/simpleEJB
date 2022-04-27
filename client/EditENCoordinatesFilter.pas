
unit EditENCoordinatesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCoordinatesController ;

type
  TfrmENCoordinatesFilterEdit = class(TDialogForm)

    lblLatitude : TLabel;
    edtLatitude: TEdit;

    lblLongitude : TLabel;
    edtLongitude: TEdit;

    lblLatitude2 : TLabel;
    edtLatitude2: TEdit;

    lblLongitude2 : TLabel;
    edtLongitude2: TEdit;

    lblgeographicCode : TLabel;
    edtgeographicCode: TEdit;


  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENCoordinates: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENCoordinatesFilterEdit: TfrmENCoordinatesFilterEdit;
  ENCoordinatesFilterObj: ENCoordinatesFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENCoordinatesController  ;
}
{$R *.dfm}



procedure TfrmENCoordinatesFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENCoordinatesObj.latitude <> nil ) then
       edtLatitude.Text := ENCoordinatesObj.latitude.decimalString
    else
       edtLatitude.Text := ''; 



    if ( ENCoordinatesObj.longitude <> nil ) then
       edtLongitude.Text := ENCoordinatesObj.longitude.decimalString
    else
       edtLongitude.Text := ''; 



    if ( ENCoordinatesObj.latitude2 <> nil ) then
       edtLatitude2.Text := ENCoordinatesObj.latitude2.decimalString
    else
       edtLatitude2.Text := ''; 



    if ( ENCoordinatesObj.longitude2 <> nil ) then
       edtLongitude2.Text := ENCoordinatesObj.longitude2.decimalString
    else
       edtLongitude2.Text := ''; 



    edtgeographicCode.Text := ENCoordinatesObj.geographicCode; 


  end;

}

end;



procedure TfrmENCoordinatesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCoordinates: ENCoordinatesControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENCoordinatesFilterObj.latitude = nil ) then
       ENCoordinatesFilterObj.latitude := TXSDecimal.Create;
     if edtLatitude.Text <> '' then
       ENCoordinatesFilterObj.latitude.decimalString := edtLatitude.Text 
     else
       ENCoordinatesFilterObj.latitude := nil;




     if (ENCoordinatesFilterObj.longitude = nil ) then
       ENCoordinatesFilterObj.longitude := TXSDecimal.Create;
     if edtLongitude.Text <> '' then
       ENCoordinatesFilterObj.longitude.decimalString := edtLongitude.Text 
     else
       ENCoordinatesFilterObj.longitude := nil;




     if (ENCoordinatesFilterObj.latitude2 = nil ) then
       ENCoordinatesFilterObj.latitude2 := TXSDecimal.Create;
     if edtLatitude2.Text <> '' then
       ENCoordinatesFilterObj.latitude2.decimalString := edtLatitude2.Text 
     else
       ENCoordinatesFilterObj.latitude2 := nil;




     if (ENCoordinatesFilterObj.longitude2 = nil ) then
       ENCoordinatesFilterObj.longitude2 := TXSDecimal.Create;
     if edtLongitude2.Text <> '' then
       ENCoordinatesFilterObj.longitude2.decimalString := edtLongitude2.Text 
     else
       ENCoordinatesFilterObj.longitude2 := nil;




     ENCoordinatesFilterObj.geographicCode := edtgeographicCode.Text; 




  end;
end;

procedure TfrmENCoordinatesFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENCoordinatesFilterObj.element = nil then ENCoordinatesFilterObj.element := ENElement.Create();
               ENCoordinatesFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





end.