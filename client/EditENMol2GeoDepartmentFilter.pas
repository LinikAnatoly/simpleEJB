
unit EditENMol2GeoDepartmentFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMol2GeoDepartmentController ;

type
  TfrmENMol2GeoDepartmentFilterEdit = class(TDialogForm)


  lblENMolMolName : TLabel;
  edtENMolMolName : TEdit;
  spbENMolMol : TSpeedButton;
  

  HTTPRIOENMol2GeoDepartment: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENMolMolClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENMol2GeoDepartmentFilterEdit: TfrmENMol2GeoDepartmentFilterEdit;
  ENMol2GeoDepartmentFilterObj: ENMol2GeoDepartmentFilter;

implementation

uses
  ShowENMol
  ,ENMolController
;

{uses  
    EnergyproController, EnergyproController2, ENMol2GeoDepartmentController  ;
}
{$R *.dfm}



procedure TfrmENMol2GeoDepartmentFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
  end;

}

end;



procedure TfrmENMol2GeoDepartmentFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMol2GeoDepartment: ENMol2GeoDepartmentControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;

procedure TfrmENMol2GeoDepartmentFilterEdit.spbENMolMolClick(Sender : TObject);
var 
   frmENMolShow: TfrmENMolShow;
begin
   frmENMolShow:=TfrmENMolShow.Create(Application,fmNormal);
   try
      with frmENMolShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMol2GeoDepartmentFilterObj.mol = nil then ENMol2GeoDepartmentFilterObj.mol := ENMol.Create();
               ENMol2GeoDepartmentFilterObj.mol.code := StrToInt(GetReturnValue(sgENMol,0));
               edtENMolMolName.Text:=GetReturnValue(sgENMol,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENMolShow.Free;
   end;
end;





end.