
unit EditENConnectionPhasityFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionPhasityController ;

type
  TfrmENConnectionPhasityFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENConnectionPhasity: THTTPRIO;

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
  frmENConnectionPhasityFilterEdit: TfrmENConnectionPhasityFilterEdit;
  ENConnectionPhasityFilterObj: ENConnectionPhasityFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionPhasityController  ;
}
{$R *.dfm}



procedure TfrmENConnectionPhasityFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENConnectionPhasityObj.name; 


  end;

}

end;



procedure TfrmENConnectionPhasityFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionPhasity: ENConnectionPhasityControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENConnectionPhasityFilterObj.name := edtName.Text; 




  end;
end;




end.