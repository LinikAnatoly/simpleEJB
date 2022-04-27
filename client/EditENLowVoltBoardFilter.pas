
unit EditENLowVoltBoardFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLowVoltBoardController ;

type
  TfrmENLowVoltBoardFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENLowVoltBoard: THTTPRIO;

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
  frmENLowVoltBoardFilterEdit: TfrmENLowVoltBoardFilterEdit;
  ENLowVoltBoardFilterObj: ENLowVoltBoardFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENLowVoltBoardController  ;
}
{$R *.dfm}



procedure TfrmENLowVoltBoardFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENLowVoltBoardObj.name; 


  end;

}

end;



procedure TfrmENLowVoltBoardFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENLowVoltBoardFilterObj.name := edtName.Text; 




  end;
end;

procedure TfrmENLowVoltBoardFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLowVoltBoardFilterObj.element = nil then ENLowVoltBoardFilterObj.element := ENElement.Create();
               ENLowVoltBoardFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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