
unit EditEquipChangeWorkerFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, EquipChangeWorkerController ;

type
  TfrmEquipChangeWorkerFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOEquipChangeWorker: THTTPRIO;

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
  frmEquipChangeWorkerFilterEdit: TfrmEquipChangeWorkerFilterEdit;
  EquipChangeWorkerFilterObj: EquipChangeWorkerFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, EquipChangeWorkerController  ;
}
{$R *.dfm}



procedure TfrmEquipChangeWorkerFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := EquipChangeWorkerObj.name; 


  end;

}

end;



procedure TfrmEquipChangeWorkerFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempEquipChangeWorker: EquipChangeWorkerControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     EquipChangeWorkerFilterObj.name := edtName.Text; 




  end;
end;




end.