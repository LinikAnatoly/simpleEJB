
unit EditRQPackingListStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPackingListStatusController ;

type
  TfrmRQPackingListStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQPackingListStatus: THTTPRIO;

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
  frmRQPackingListStatusFilterEdit: TfrmRQPackingListStatusFilterEdit;
  RQPackingListStatusFilterObj: RQPackingListStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPackingListStatusController  ;
}
{$R *.dfm}



procedure TfrmRQPackingListStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQPackingListStatusObj.name; 


  end;

}

end;



procedure TfrmRQPackingListStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPackingListStatus: RQPackingListStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQPackingListStatusFilterObj.name := edtName.Text; 




  end;
end;




end.