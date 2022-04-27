
unit EditENAntsapfPositionFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAntsapfPositionController ;

type
  TfrmENAntsapfPositionFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENAntsapfPosition: THTTPRIO;

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
  frmENAntsapfPositionFilterEdit: TfrmENAntsapfPositionFilterEdit;
  ENAntsapfPositionFilterObj: ENAntsapfPositionFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAntsapfPositionController  ;
}
{$R *.dfm}



procedure TfrmENAntsapfPositionFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENAntsapfPositionObj.name; 


  end;

}

end;



procedure TfrmENAntsapfPositionFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAntsapfPosition: ENAntsapfPositionControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENAntsapfPositionFilterObj.name := edtName.Text; 




  end;
end;




end.