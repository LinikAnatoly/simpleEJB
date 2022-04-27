unit BindingCounters2ServicesObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs , DialogFormUnit, StdCtrls, InvokeRegistry, Rio, SOAPHTTPClient  , SOAPHTTPTrans ;

type
  TFrmBindingCounters2ServicesObject = class(TDialogForm)
    btnmoveCounter2enservicesobject: TButton;
    memoData: TMemo;
    log2: TMemo;
    log: TMemo;
    HTTPRIOENServicesObject: THTTPRIO;
    edt_test: TEdit;
    HTTPRIOENIP: THTTPRIO;
    btntest_admin: TButton;
    procedure btnmoveCounter2enservicesobjectClick(Sender: TObject);
    procedure btntest_adminClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBindingCounters2ServicesObject: TFrmBindingCounters2ServicesObject;

implementation

uses
  ENServicesObjectController, Main, ENIPController;

{$R *.dfm}

procedure TFrmBindingCounters2ServicesObject.btnmoveCounter2enservicesobjectClick(
  Sender: TObject);
var
 TempENServicesObject : ENServicesObjectControllerSoapPort;
 p , i: integer;
 p1 , p2  , tempString : string;
begin
  inherited;
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;


     for i:= 0 to memoData.Lines.Count  -1 do
    try
      tempString := memoData.Lines[i];
      tempString := Trim(tempString);
      tempString := StringReplace(tempString , ' ' , '' , [rfReplaceAll, rfIgnoreCase] );

       p1 := Copy(tempString,3,Pos('p2',tempString)-3);

       p2 := Copy(tempString,Pos('p2',tempString)+2);


       TempENServicesObject.autoCreateFkOrderMoveCounterForServices(p1 , p2);

       frmMain.sbMain.Panels[2].Text := IntToStr(i+1) + ' из ' + IntToStr(memoData.Lines.Count );
       Application.ProcessMessages;

     except

      on E: ESOAPHTTPException do
      begin
        case ESOAPHTTPException(E).StatusCode of
          0:
            begin
              //Application.MessageBox(PChar('Нет связи ...'),
              //                       PChar('Ошибка!'),MB_ICONERROR+MB_OK);
              Exit;
            end;

          503:
            begin
              //Application.MessageBox(PChar('Служба недоступна'),
              //                       PChar('Ошибка!'),MB_ICONERROR+MB_OK);
              Exit;
            end;
        end;
       end;
       on E: ERemotableException do
       begin
         log.Lines.Add('#' + IntToStr(p) + '$');
         log2.lines.Add(IntToStr(p) + ' : ' + e.Message);
         Application.ProcessMessages;
       end;

       on E: Exception do
       begin
         log2.Lines.Add('error: ' + IntToStr(p) + ' : ' +  e.message);
         Exit;
       end;

    end;

end;

procedure TFrmBindingCounters2ServicesObject.btntest_adminClick(
  Sender: TObject);
var
 TempENIP: ENIPControllerSoapPort;
 p , i: integer;
begin

  inherited;
    TempENIP := HTTPRIOENIP as ENIPControllerSoapPort;

    TempENIP.test_admin(StrToInt(edt_test.Text));

end;


end.
