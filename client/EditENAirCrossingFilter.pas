
unit EditENAirCrossingFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAirCrossingController ;

type
  TfrmENAirCrossingFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblSizeBottomLength : TLabel;
    edtSizeBottomLength: TEdit;

    lblFlightLength : TLabel;
    edtFlightLength: TEdit;



  HTTPRIOENAirCrossing: THTTPRIO;

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
  frmENAirCrossingFilterEdit: TfrmENAirCrossingFilterEdit;
  ENAirCrossingFilterObj: ENAirCrossingFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAirCrossingController  ;
}
{$R *.dfm}



procedure TfrmENAirCrossingFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENAirCrossingObj.name; 



    if ( ENAirCrossingObj.sizeBottomLength <> nil ) then
       edtSizeBottomLength.Text := ENAirCrossingObj.sizeBottomLength.decimalString
    else
       edtSizeBottomLength.Text := ''; 



    if ( ENAirCrossingObj.flightLength <> nil ) then
       edtFlightLength.Text := ENAirCrossingObj.flightLength.decimalString
    else
       edtFlightLength.Text := ''; 


  end;

}

end;



procedure TfrmENAirCrossingFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENAirCrossing: ENAirCrossingControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENAirCrossingFilterObj.name := edtName.Text; 



     if (ENAirCrossingFilterObj.sizeBottomLength = nil ) then
       ENAirCrossingFilterObj.sizeBottomLength := TXSDecimal.Create;
     if edtSizeBottomLength.Text <> '' then
       ENAirCrossingFilterObj.sizeBottomLength.decimalString := edtSizeBottomLength.Text 
     else
       ENAirCrossingFilterObj.sizeBottomLength := nil;




     if (ENAirCrossingFilterObj.flightLength = nil ) then
       ENAirCrossingFilterObj.flightLength := TXSDecimal.Create;
     if edtFlightLength.Text <> '' then
       ENAirCrossingFilterObj.flightLength.decimalString := edtFlightLength.Text 
     else
       ENAirCrossingFilterObj.flightLength := nil;





  end;
end;




end.