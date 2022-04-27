
unit EditENWarrantStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWarrantStatusController ;

type
  TfrmENWarrantStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENWarrantStatus: THTTPRIO;

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
  frmENWarrantStatusFilterEdit: TfrmENWarrantStatusFilterEdit;
  ENWarrantStatusFilterObj: ENWarrantStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWarrantStatusController  ;
}
{$R *.dfm}



procedure TfrmENWarrantStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENWarrantStatusObj.name; 


  end;

}

end;



procedure TfrmENWarrantStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWarrantStatus: ENWarrantStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENWarrantStatusFilterObj.name := edtName.Text; 




  end;
end;




end.