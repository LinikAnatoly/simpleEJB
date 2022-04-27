
unit EditENPlanWorkItem2TKKoefFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkItem2TKKoefController ;

type
  TfrmENPlanWorkItem2TKKoefFilterEdit = class(TDialogForm)

    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblTKTechCardSourceKoefSourceKoefName : TLabel;
  edtTKTechCardSourceKoefSourceKoefName : TEdit;
  spbTKTechCardSourceKoefSourceKoef : TSpeedButton;
  

  HTTPRIOENPlanWorkItem2TKKoef: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKTechCardSourceKoefSourceKoefClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPlanWorkItem2TKKoefFilterEdit: TfrmENPlanWorkItem2TKKoefFilterEdit;
  ENPlanWorkItem2TKKoefFilterObj: ENPlanWorkItem2TKKoefFilter;

implementation

uses
  ShowTKTechCardSourceKoef
  ,TKTechCardSourceKoefController
;

{uses  
    EnergyproController, EnergyproController2, ENPlanWorkItem2TKKoefController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkItem2TKKoefFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtCommentGen.Text := ENPlanWorkItem2TKKoefObj.commentGen; 


  end;

}

end;



procedure TfrmENPlanWorkItem2TKKoefFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkItem2TKKoef: ENPlanWorkItem2TKKoefControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPlanWorkItem2TKKoefFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;

procedure TfrmENPlanWorkItem2TKKoefFilterEdit.spbTKTechCardSourceKoefSourceKoefClick(Sender : TObject);
var 
   frmTKTechCardSourceKoefShow: TfrmTKTechCardSourceKoefShow;
begin
   frmTKTechCardSourceKoefShow:=TfrmTKTechCardSourceKoefShow.Create(Application,fmNormal);
   try
      with frmTKTechCardSourceKoefShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkItem2TKKoefFilterObj.sourceKoef = nil then ENPlanWorkItem2TKKoefFilterObj.sourceKoef := TKTechCardSourceKoef.Create();
               ENPlanWorkItem2TKKoefFilterObj.sourceKoef.code := StrToInt(GetReturnValue(sgTKTechCardSourceKoef,0));
               edtTKTechCardSourceKoefSourceKoefName.Text:=GetReturnValue(sgTKTechCardSourceKoef,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTechCardSourceKoefShow.Free;
   end;
end;





end.