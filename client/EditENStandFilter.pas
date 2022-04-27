
unit EditENStandFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENStandController ;

type
  TfrmENStandFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  
  lblENStandTypeMaterialTypeName : TLabel;
  edtENStandTypeMaterialTypeName : TEdit;
  spbENStandTypeMaterialType : TSpeedButton;
  

  HTTPRIOENStand: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
  procedure spbENStandTypeMaterialTypeClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENStandFilterEdit: TfrmENStandFilterEdit;
  ENStandFilterObj: ENStandFilter;

implementation

uses
  ShowENElement
  ,ENElementController
  ,ShowENStandType
  ,ENStandTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENStandController  ;
}
{$R *.dfm}



procedure TfrmENStandFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENStandObj.name; 


  end;

}

end;



procedure TfrmENStandFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENStand: ENStandControllerSoapPort; //»сключено объ€вление не используемых переменных
begin
  if (ModalResult = mrOk)  then
  begin

     ENStandFilterObj.name := edtName.Text; 




  end;
end;

procedure TfrmENStandFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENStandFilterObj.element = nil then ENStandFilterObj.element := ENElement.Create();
               ENStandFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENStandFilterEdit.spbENStandTypeMaterialTypeClick(Sender : TObject);
var 
   frmENStandTypeShow: TfrmENStandTypeShow;
begin
   frmENStandTypeShow:=TfrmENStandTypeShow.Create(Application,fmNormal);
   try
      with frmENStandTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENStandFilterObj.materialType = nil then ENStandFilterObj.materialType := ENStandType.Create();
               ENStandFilterObj.materialType.code := StrToInt(GetReturnValue(sgENStandType,0));
               edtENStandTypeMaterialTypeName.Text:=GetReturnValue(sgENStandType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENStandTypeShow.Free;
   end;
end;





end.