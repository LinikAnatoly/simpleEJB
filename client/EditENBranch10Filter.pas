
unit EditENBranch10Filter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBranch10Controller ;

type
  TfrmENBranch10FilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblBranchLength : TLabel;
    edtBranchLength: TEdit;

    lblDispOffName : TLabel;
    edtDispOffName: TEdit;


  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENBranch10: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENBranch10FilterEdit: TfrmENBranch10FilterEdit;
  ENBranch10FilterObj: ENBranch10Filter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENBranch10Controller  ;
}
{$R *.dfm}



procedure TfrmENBranch10FilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtBranchLength
      ,edtDispOffName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENBranch10Obj.name; 



    if ( ENBranch10Obj.branchLength <> nil ) then
       edtBranchLength.Text := ENBranch10Obj.branchLength.decimalString
    else
       edtBranchLength.Text := ''; 



    edtDispOffName.Text := ENBranch10Obj.dispOffName; 


  end;

}

end;



procedure TfrmENBranch10FilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENBranch10: ENBranch10ControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBranch10FilterObj.name := edtName.Text; 



     if (ENBranch10FilterObj.branchLength = nil ) then
       ENBranch10FilterObj.branchLength := TXSDecimal.Create;
     if edtBranchLength.Text <> '' then
       ENBranch10FilterObj.branchLength.decimalString := edtBranchLength.Text 
     else
       ENBranch10FilterObj.branchLength := nil;




     ENBranch10FilterObj.dispOffName := edtDispOffName.Text; 




  end;
end;

procedure TfrmENBranch10FilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBranch10FilterObj.element = nil then ENBranch10FilterObj.element := ENElement.Create();
               ENBranch10FilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





end.