
unit EditRQOrderFormFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderFormController ;

type
  TfrmRQOrderFormFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQOrderForm: THTTPRIO;

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
  frmRQOrderFormFilterEdit: TfrmRQOrderFormFilterEdit;
  RQOrderFormFilterObj: RQOrderFormFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderFormController  ;
}
{$R *.dfm}



procedure TfrmRQOrderFormFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQOrderFormObj.name; 


  end;

}

end;



procedure TfrmRQOrderFormFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderForm: RQOrderFormControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQOrderFormFilterObj.name := edtName.Text; 




  end;
end;




end.