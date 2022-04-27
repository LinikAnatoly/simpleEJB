unit BeanShell;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, DateUtils, ToolWin, ChildFormUnit,
  Lucombo, dblucomb, AdvMemo;

type
  TfrmBeanShell = class(TChildForm)
    HTTPRIOTKMaterials: THTTPRIO;
    ImageList1: TImageList;
    ActionList1: TActionList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    actExecute: TAction;
    gbResults: TGroupBox;
    edtResults: TRichEdit;
    HTTPRIOSkorpion: THTTPRIO;
    memoBeanShell: TAdvMemo;
    procedure FormResize(Sender: TObject);
    procedure resizing;
    procedure actExecuteExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }

  public
    { Public declarations }
  end;



implementation
uses ENConsts
     , EnergyproController, DMReportsUnit
     , SkorpionController
     , Main;

{$R *.dfm}

procedure TfrmBeanShell.actExecuteExecute(Sender: TObject);
var
  skorpContr : SkorpionControllerSoapPort;
  result : String;
  beanShellScript : String;
  i : Integer;
begin
  inherited;
  try
      skorpContr := HTTPRIOSkorpion as SkorpionControllerSoapPort;
      for i := 0 to memoBeanShell.Lines.Count - 1 do begin
          beanShellScript := beanShellScript + memoBeanShell.Lines[i] + Chr(10);
      end;
      result := skorpContr.executeBeanShellScript(beanShellScript);
      edtResults.Font.Color := clBlack;
  except
         on E: ERemotableException do begin
          edtResults.Font.Color := clRed;
          result := 'Œÿ»¡ ¿: ' + E.Message;
        end;

  end;

  edtResults.Text := result;

end;

procedure TfrmBeanShell.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    if FormMode = fmChild then
      frmBeanShell:=nil;
    inherited;
end;

procedure TfrmBeanShell.FormResize(Sender: TObject);
begin
  inherited;
  resizing;
end;

procedure TfrmBeanShell.resizing;
begin
  memoBeanShell.Height := Round(Self.Height * 0.6);
  gbResults.Height := Round(Self.Height * 0.25);
end;

end.
