
unit EditRQAllocationListFormFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQAllocationListFormController ;

type
  TfrmRQAllocationListFormFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQAllocationListForm: THTTPRIO;

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
  frmRQAllocationListFormFilterEdit: TfrmRQAllocationListFormFilterEdit;
  RQAllocationListFormFilterObj: RQAllocationListFormFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQAllocationListFormController  ;
}
{$R *.dfm}



procedure TfrmRQAllocationListFormFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQAllocationListFormObj.name; 


  end;

}

end;



procedure TfrmRQAllocationListFormFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQAllocationListForm: RQAllocationListFormControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQAllocationListFormFilterObj.name := edtName.Text; 




  end;
end;




end.