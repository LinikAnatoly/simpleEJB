
unit EditENHighVoltageSellFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENHighVoltageSellController ;

type
  TfrmENHighVoltageSellFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;


  lblENHighVoltageSellTypeHighvoltageTypeName : TLabel;
  edtENHighVoltageSellTypeHighvoltageTypeName : TEdit;
  spbENHighVoltageSellTypeHighvoltageType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENHighVoltageSell: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENHighVoltageSellTypeHighvoltageTypeClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENHighVoltageSellFilterEdit: TfrmENHighVoltageSellFilterEdit;
  ENHighVoltageSellFilterObj: ENHighVoltageSellFilter;

implementation

uses
  ShowENHighVoltageSellType
  ,ENHighVoltageSellTypeController
  ,ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENHighVoltageSellController  ;
}
{$R *.dfm}



procedure TfrmENHighVoltageSellFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtNumberGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENHighVoltageSellObj.name; 



    edtNumberGen.Text := ENHighVoltageSellObj.numberGen; 


  end;

}

end;



procedure TfrmENHighVoltageSellFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENHighVoltageSellFilterObj.name := edtName.Text; 



     ENHighVoltageSellFilterObj.numberGen := edtNumberGen.Text; 




  end;
end;

procedure TfrmENHighVoltageSellFilterEdit.spbENHighVoltageSellTypeHighvoltageTypeClick(Sender : TObject);
var 
   frmENHighVoltageSellTypeShow: TfrmENHighVoltageSellTypeShow;
begin
   frmENHighVoltageSellTypeShow:=TfrmENHighVoltageSellTypeShow.Create(Application,fmNormal);
   try
      with frmENHighVoltageSellTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENHighVoltageSellFilterObj.highvoltageType = nil then ENHighVoltageSellFilterObj.highvoltageType := ENHighVoltageSellType.Create();
               ENHighVoltageSellFilterObj.highvoltageType.code := StrToInt(GetReturnValue(sgENHighVoltageSellType,0));
               edtENHighVoltageSellTypeHighvoltageTypeName.Text:=GetReturnValue(sgENHighVoltageSellType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENHighVoltageSellTypeShow.Free;
   end;
end;


procedure TfrmENHighVoltageSellFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENHighVoltageSellFilterObj.element = nil then ENHighVoltageSellFilterObj.element := ENElement.Create();
               ENHighVoltageSellFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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