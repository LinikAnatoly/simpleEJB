
unit EditRQMeasurementFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQMeasurementController ;

type
  TfrmRQMeasurementFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblShortName : TLabel;
    edtShortName: TEdit;
    lblOutCode : TLabel;
    edtOutCode: TEdit;


  HTTPRIORQMeasurement: THTTPRIO;

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
  frmRQMeasurementFilterEdit: TfrmRQMeasurementFilterEdit;
  RQMeasurementFilterObj: RQMeasurementFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQMeasurementController  ;
}
{$R *.dfm}



procedure TfrmRQMeasurementFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtShortName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := RQMeasurementObj.name; 



    edtShortName.Text := RQMeasurementObj.shortName; 



    if ( RQMeasurementObj.outCode <> Low(Integer) ) then
       edtOutCode.Text := IntToStr(RQMeasurementObj.outCode)
    else
       edtOutCode.Text := '';


  end;

}

end;



procedure TfrmRQMeasurementFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQMeasurement: RQMeasurementControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQMeasurementFilterObj.name := edtName.Text; 



     RQMeasurementFilterObj.shortName := edtShortName.Text; 



     if ( edtOutCode.Text <> '' ) then
       RQMeasurementFilterObj.outCode := StrToInt(edtOutCode.Text)
     else
       RQMeasurementFilterObj.outCode := Low(Integer) ;





  end;
end;




end.